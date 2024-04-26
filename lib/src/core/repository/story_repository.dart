import 'package:get/get.dart';
import 'package:zexonline/src/api/api.dart';
import 'package:zexonline/src/api/apiUrl.dart';
import 'package:zexonline/src/core/model/request/story_request.dart';
import 'package:zexonline/src/core/model/response/chapter_detail_response.dart';
import 'package:zexonline/src/core/model/response/chapter_list_response.dart';
import 'package:zexonline/src/core/model/response/genres_response.dart';
import 'package:zexonline/src/core/model/response/stories_response.dart';
import 'package:zexonline/src/core/model/response/story_detail_response.dart';
import 'package:zexonline/src/extensions/string_extensions.dart';
import 'package:zexonline/src/utils/app_shared.dart';

class StoryRepository extends Api {
  StoryRepository();

  Future<StoriesResponse> getStories(StoryRequest params) async {
    final url = APIUrl.getStories;
    final response = await request(url, Method.get, useIDToken: false, params: params.toJson());
    return StoriesResponse.fromJson(response.data);
  }

  Future<StoriesResponse> getHistories(StoryRequest params) async {
    final url = APIUrl.getHistories;
    final response = await request(url, Method.get, params: params.toJson());

    return StoriesResponse.fromJson(response.data);
  }

  Future<StoriesResponse> getHistoriesGuest(List<String> ids) async {
    if(ids.isEmpty) return StoriesResponse.fromJson({});

    final url = APIUrl.getHistoriesGuest;

    String params = '';
    for (int i = 0; i < ids.length; i++) {
      params += ids[i];
      if (i < ids.length - 1) {
        params += ",";
      }
    }


    final response = await request(url, Method.get, params: {'ids': params});

    return StoriesResponse.fromJson(response.data);
  }

  Future<StoriesResponse> getFavorites(StoryRequest params) async {
    final url = APIUrl.getFavorites;
    final response = await request(url, Method.get, params: params.toJson());

    return StoriesResponse.fromJson(response.data);
  }

  Future<GenreResponse> getGenres() async {
    final url = APIUrl.getGenre;
    final response = await request(url, Method.get, useIDToken: false);

    return GenreResponse.fromJson(response.data);
  }

  Future<StoryDetailResponse> getStoryDetail(String id) async {
    final url = APIUrl.getStoryDetail(id);

    String? tokenValue = Get.find<AppShared>().getTokenValue();
    final useIDToken = !(tokenValue).isNullOrEmpty() ? true : false;

    final response = await request(url, Method.get, useIDToken: useIDToken);

    return StoryDetailResponse.fromJson(response.data);
  }

  Future<StoryDetailResponse> postFavoriteStory(String id) async {
    final url = APIUrl.postFavoriteStoryDetail(id);

    final response = await request(url, Method.post);

    return StoryDetailResponse.fromJson(response.data);
  }

  Future<StoryDetailResponse> postUnFavoriteStory(String id) async {
    final url = APIUrl.postUnFavoriteStoryDetail(id);
    final response = await request(url, Method.post);

    return StoryDetailResponse.fromJson(response.data);
  }

  Future<ChapterListResponse> getChapterList(String storyId,
      {String sort = 'asc', int next = 0, int limit = 25}) async {
    final Map<String, dynamic> params = {'sort': sort, 'next': next, 'limit': limit};
    final url = APIUrl.getChaptersList(storyId);
    final response = await request(url, Method.get, useIDToken: false, params: params);

    return ChapterListResponse.fromJson(response.data);
  }

  Future<ChapterDetailResponse> getChapterDetail(String chapterId) async {
    final url = APIUrl.getChapterDetail(chapterId);
    final response = await request(url, Method.get, useIDToken: false);

    print("getChapterDetail $url--- ${response.data}");
    return ChapterDetailResponse.fromJson(response.data);
  }
}
