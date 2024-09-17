

import 'package:core_module/features/firebase/data/repositories/firebase_email_verification_repository_impl.dart';

mixin FirebaseEmailVerification{
  final FirebaseEmailVerificationRepositoryImpl _repository = FirebaseEmailVerificationRepositoryImpl();

  void startEmailVerificationListener({int timeoutSeconds = 5}){
    _repository.startEmailVerificationListener(timeoutSeconds: timeoutSeconds);
  }

  void stopEmailVerificationListener(){
    _repository.stopEmailVerificationListener();
  }
}