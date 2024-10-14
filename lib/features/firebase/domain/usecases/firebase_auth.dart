import 'package:core_module/core_module.dart';
import 'package:core_module/features/firebase/data/repositories/firebase_auth_repository_impl.dart';
import 'package:dartz/dartz.dart';

mixin FirebaseAuthService {
  final FirebaseAuthRepository _repository = FirebaseAuthRepository();

  Future<Either<Exception, User?>> signUp(String email, String password) async {
    return _repository.singUp(email: email, password: password);
  }

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    return _repository.signIn(email: email, password: password);
  }

  Future<void> signOut() async {
    _repository.signOut();
  }

  Future<bool> removeUser() async {
    return _repository.removeUser();
  }

  User? getUser(){
    return _repository.getUser();
  }

}