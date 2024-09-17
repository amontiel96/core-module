typedef MessageNotification = Map<String, dynamic>;

abstract class FirebaseServicesInterface {
  Future<void> initMessaging();

  Future<bool> requestPermission();

  Future<String?> getToken();

  Future<void> saveToken();

  Future<void> deleteToken();

  Future<void> createPushNotification(MessageNotification body);

  String get className;
}
