import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:chunked_stream/chunked_stream.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as get_x;
import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';
import 'package:zexonline/src/api/apiUrl.dart';
import 'package:zexonline/src/extensions/string_extensions.dart';
import 'package:zexonline/src/ui/widgets/base/toast/app_toast.dart';
import 'package:zexonline/src/utils/app_shared.dart';

/// The HTTP method request
enum Method { post, put, patch, delete, get }

/// Timeout request
int receiveTimeout = 30;
int sendTimeout = 30;

class Api {
  static final dio = Dio();

  /// This method to get data from server
  Future<Response<T>> request<T>(
    String url,
    Method method, {
    dynamic body,
    Map<String, dynamic>? params,
    bool useIDToken = true,
    Map<String, dynamic>? headersOverwrite,
    String? customContentType,
    Map<String, dynamic>? customHeader,
    Map<String, dynamic>? headerAddition,
    Function(int, int)? onSendProgress,
    Options? cacheOptions,
  }) async {
    Map<String, dynamic> headers = {
      'cache-control': 'cache',
      'Content-Type': customContentType ?? 'application/json',
      'Connection': 'keep-alive'
    };

    var combinedMap = headers;
    if (headersOverwrite != null) {
      var mapList = [headers, headersOverwrite];
      combinedMap = mapList.reduce((map1, map2) => map1..addAll(map2));
    }
    Map<String, dynamic> header = customHeader ?? HashMap.from(combinedMap);
    if (headerAddition != null) {
      header.addAll(headerAddition);
    }

    if (useIDToken) {
      final appShared = get_x.Get.find<AppShared>();
      String? tokenValue = appShared.getTokenValue();
      if (!tokenValue.isNullOrEmpty()) {
        header['Authorization'] = 'Bearer $tokenValue';
      }
    }

    Response<T> response;
    Options options = Options(
        headers: header,
        persistentConnection: false,
        receiveTimeout: Duration(seconds: receiveTimeout),
        sendTimeout: Duration(seconds: sendTimeout));

    try {
      switch (method) {
        case Method.post:
          response = await dio.post(url,
              data: body,
              options: options,
              queryParameters: params,
              onSendProgress: onSendProgress);
          break;
        case Method.put:
          response = await dio.put(
            url,
            data: body,
            options: options,
            queryParameters: params,
            onSendProgress: onSendProgress,
          );
          break;
        case Method.patch:
          response = await dio.patch(url, data: body, options: options, queryParameters: params);
          break;
        case Method.delete:
          response = await dio.delete(url, options: options, data: body, queryParameters: params);
          break;
        default:
          response = await dio.get(url,
              options: cacheOptions != null
                  ? cacheOptions.copyWith(
                      headers: header,
                      persistentConnection: false,
                      receiveTimeout: Duration(seconds: receiveTimeout),
                      sendTimeout: Duration(seconds: sendTimeout))
                  : options,
              queryParameters: params);
      }
      return response;
    } catch (e) {
      debugPrint("📕 error at api: $url");
      debugPrint('📕 error $e');

      if (e is DioException) {
        if (e.response?.data['errors'] != null) {
          String? firstError = e.response?.data['errors'].values.first;
          if (!firstError.isNullOrEmpty()) {
            showErrorToast(firstError);
          }
        } else if (e.response?.data['message'] != null) {
          showErrorToast(e.response?.data['message']);
        }
      }

      rethrow;
    }
  }

  /// Use to upload small/medium images to the server.
  Future<String> uploadImage(
      {File? file, Function(int, int)? onSendProgress, String? objectType}) async {
    final url = APIUrl.upload;
    String fileName = file!.path.split('/').last;
    String fileType = fileName.split('.').last;
    String? mimeType = mime(fileName);
    if (mimeType != null) {
      fileType = mimeType.split('/').first;
    }

    Map<String, dynamic> params = {"file_type": fileType, "file_name": fileName};

    if (objectType != null) {
      params.addAll({'object_type': objectType});
    }

    final response = await request(url, Method.post, body: params);
    final uploadUrl = response.data['url'];
    var bytes = File(file.path).readAsBytesSync();
    await http.put(Uri.parse(uploadUrl), body: bytes);
    return response.data['key'];
  }

  /// Use to upload large images/files to the server
  Future<String> uploadMultipart({
    File? file,
  }) async {
    FileType fileType = FileType.any;
    String fileName = '';

    fileType = file!.path.fileType;
    fileName = file.path.name;

    final response = await request(APIUrl.createMultiPartUpload, Method.post, body: {
      "file_name": fileName,
      "file_type": fileType.name,
    });
    UploadMultipartRequest uploadMultipartRequest = UploadMultipartRequest();
    await uploadMultipartRequest.upload(
        file: file, key: response.data['key'], uploadId: response.data['upload_id']);
    return response.data['key'];
  }
}

/// Class for upload file by chunk. DO NOT CHANGE
class UploadMultipartRequest {
  Future<String> upload({required File file, required String key, required String uploadId}) async {
    int maxChunkSize = 5 * 1024 * 1024;
    int fileSize = file.lengthSync();
    maxChunkSize = min(fileSize, maxChunkSize);

    List<Map<String, String>> promisesArray = [];
    int chunksCount = _chunksCount(fileSize, maxChunkSize);
    for (int i = 0; i < chunksCount; i++) {
      final start = _getChunkStart(i, maxChunkSize);
      final end = _getChunkEnd(i, maxChunkSize, fileSize);
      final chunkStream = _getChunkStream(file, start, end);

      // (1) Generate presigned URL for each part
      var getUploadUrlResp = await Api().request(APIUrl.createPresignedLink, Method.post,
          body: FormData.fromMap({'key': key, 'part_no': i + 1, 'upload_id': uploadId}));
      var presignedUrl = getUploadUrlResp.data['url'];

      // (2) Puts each file part into the storage server
      final bytes = await readByteStream(chunkStream);
      var uploadResp = await http.put(
        Uri.parse(presignedUrl),
        body: bytes,
      );

      promisesArray.add(uploadResp.headers);
    }

    List<Map<String, dynamic>> uploadPartsArray = [];
    for (var resolvedPromise in promisesArray) {
      uploadPartsArray.add({
        'ETag': jsonDecode(resolvedPromise['etag']!),
        'PartNumber': promisesArray.indexOf(resolvedPromise) + 1,
      });
    }
    // (3) Calls the CompleteMultipartUpload endpoint in the backend server
    await Api().request(APIUrl.completeMultiPartUpload, Method.post, body: {
      'key': key,
      'parts': uploadPartsArray,
      'upload_id': uploadId,
    });
    return key;
  }

  Stream<List<int>> _getChunkStream(File file, int start, int end) => file.openRead(start, end);

  // Returning start byte offset of current chunk
  int _getChunkStart(int chunkIndex, int maxChunkSize) => chunkIndex * maxChunkSize;

  // Returning end byte offset of current chunk
  int _getChunkEnd(int chunkIndex, int maxChunkSize, int fileSize) =>
      min((chunkIndex + 1) * maxChunkSize, fileSize);

  // Returning chunks count based on file size and maximum chunk size
  int _chunksCount(int fileSize, int maxChunkSize) => (fileSize / maxChunkSize).ceil();
}
