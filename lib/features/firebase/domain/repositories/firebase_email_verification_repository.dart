abstract class FirebaseEmailVerificationRepository{
  void startEmailVerificationListener({int timeoutSeconds = 5});
  void stopEmailVerificationListener();
}