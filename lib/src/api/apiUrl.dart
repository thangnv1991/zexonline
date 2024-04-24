import 'package:zexonline/src/utils/app_api_config.dart';

String baseUrl = AppApiConfig.baseApiUrl;

class APIUrl {
  // Authentication
  static String login = '${baseUrl}auth/login';
  static String signUp = '${baseUrl}auth/register';
  static String urlFCM = '${baseUrl}fcm-tokens';
  static String setting = '${baseUrl}settings';

  static String createMultiPartUpload = '${baseUrl}general/multipart-upload/';
  static String upload = '${baseUrl}common/upload/policy/';
  static String createPresignedLink = '${baseUrl}general/multipart-upload/presigned-url/';
  static String completeMultiPartUpload = '${baseUrl}general/multipart-upload/complete/';

  // Genre
  static String getGenre = '${baseUrl}genres';

  // List story
  static String getStories = '${baseUrl}reader/stories?';
  static String getHistories = '${baseUrl}reader/histories';
  static String getHistoriesGuest = '${baseUrl}reader/stories/recent';
  static String getFavorites = '${baseUrl}reader/favorites';

  // story detail
  static String getStoryDetail(String id) => '${baseUrl}reader/stories/$id';

  static String postFavoriteStoryDetail(String id) => '${baseUrl}reader/$id/favorites';

  static String postUnFavoriteStoryDetail(String id) => '${baseUrl}reader/$id/unfavored';

  static String getChaptersList(String id) => '${baseUrl}reader/$id/chapters';

  static String getChapterDetail(String id) => '${baseUrl}reader/chapters/$id';
}
