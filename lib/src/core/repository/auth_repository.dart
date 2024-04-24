import 'package:zexonline/src/api/api.dart';
import 'package:zexonline/src/api/apiUrl.dart';
import 'package:zexonline/src/core/model/response/setting_response.dart';
import 'package:zexonline/src/core/model/response/user_response.dart';
import 'package:zexonline/src/utils/app_shared.dart';

class AuthRepository extends Api {
  final AppShared _appShared;

  AuthRepository(this._appShared);

  void setTokenValue(String value) => _appShared.setTokenValue(value);

  void setUserData(User value) => _appShared.setUserData(value);

  Stream<String?> watchTokenValue() => _appShared.watchTokenValue();

  Future<UserResponse> login(Map<String, dynamic> body, bool isRemember) async {
    final url = APIUrl.login;
    final response = await request(url, Method.post, body: body, useIDToken: false);
    final data = UserResponse.fromJson(response.data);

    setTokenValue(data.data!.accessToken);
    setUserData(data.data!.user);

    return data;
  }

  Future<UserResponse> signUp(Map<String, dynamic> body) async {
    final url = APIUrl.signUp;
    final response = await request(url, Method.post, body: body, useIDToken: false);
    final data = UserResponse.fromJson(response.data);

    setTokenValue(data.data!.accessToken);
    setUserData(data.data!.user);

    return data;
  }

  Future<void> addTokenFCMApi(String firebaseToken) async {
    final url = APIUrl.urlFCM;
    await request(url, Method.post, body: {'token': firebaseToken});
  }

  Future<void> deleteTokenFCMApi(String firebaseToken) async {
    final url = APIUrl.urlFCM;
    await request(url, Method.delete, params: {'token': firebaseToken});
  }

  Future<SettingResponse> getSettings() async {
    final url = APIUrl.setting;
    final response = await request(url, Method.get);
    final data = SettingResponse.fromJson(response.data);

    return data;
  }

  Future<SettingResponse> updateSettings(bool notification) async {
    final url = APIUrl.setting;
    final response = await request(url, Method.put, body: {'notification': notification});
    final data = SettingResponse.fromJson(response.data);

    return data;
  }
}
