import 'dart:io';

import 'package:core_module/core_module.dart';
import 'package:core_module/global/data/model/token_push_notification_model.dart';




class PushNotificationRepository {
  //final GenericApiCallRepository _http = GenericApiCallRepository();
  final storage = const FlutterSecureStorage();
  final keyStorageTokenFCM = 'token_fcm';

  static final instance = PushNotificationRepository._();

  PushNotificationRepository._();

  Future<String?> getTokenFCMSecureStorage() async =>
      await storage.read(key: keyStorageTokenFCM);

  Future<bool> saveTokenFCMSecureStorage(
      TokenPushNotificationModel model) async {
    await storage.write(key: keyStorageTokenFCM, value: model.token);
    return true;
  }

  Future<bool> removeTokenFCMSecureStorage() async {
    await storage.delete(key: keyStorageTokenFCM);
    return true;
  }

  Future<bool> saveTokenFCM(TokenPushNotificationModel model) async {
    /*final baseUrl = await ServiceUtilsRepository().getApiUrl();
    String sufixUrl = '/utilities/v1-0-0-0/utils/tokennotification';
    TokenPushNotificationModel data = model;
    String url = Uri.parse('$baseUrl$sufixUrl').toString();
    final response = await _http
        .httpCall(
            url: url,
            body: data.toJson(),
            httpMethod: HttpMethods.POST,
            apipKeyType: ApipKeyType.apiurl)
        .timeout(const Duration(seconds: 30));

    if (response.statusCode != HttpStatus.ok) {
      throw Exception(response.body);
    }*/
    return true;
  }
}
