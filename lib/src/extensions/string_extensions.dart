import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:zexonline/src/utils/app_constants.dart';
import 'package:mime_type/mime_type.dart';

extension NullableStringExtensions on String? {
  /// Returns [true] if this nullable string is either null or empty.
  bool isNullOrEmpty() {
    return this?.trim().isEmpty ?? true;
  }
}

extension StringX on String {
  /// Get the filename of the URL.
  String get name {
    return split('/').last;
  }

  /// Get the file type of the filename.
  FileType get fileType {
    String mimeType = mime(split('/').last)!;
    String type = mimeType.split('/')[0];
    if (type == AppConstants.image) {
      return FileType.image;
    }
    if (type == AppConstants.video) {
      return FileType.video;
    }
    return FileType.media;
  }

  /// Format thousands number to convert to double.
  ///
  /// Example
  /// ```
  /// 1,200.50.formatThousands
  /// ```
  /// Output: 1200.50
  String get formatThousands {
    return replaceAll(',', '');
  }
}

extension StringExtensions on String {
  bool get isNetworkUri => startsWith('http');

  bool get isSvg => endsWith('.svg');

  bool get isLocalPath => File(this).existsSync();

  /// Capitalize first letter of the word
  String get inFirstLetterCaps => length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';

  /// Capitalize first letter of each word
  String get capitalizeFirstOfEach =>
      replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.inFirstLetterCaps).join(' ');

  String get correctEllipsis => replaceAll('', '\u200B');
}
