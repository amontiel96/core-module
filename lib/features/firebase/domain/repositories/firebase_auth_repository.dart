import 'package:core_module/core_module.dart';
import 'package:dartz/dartz.dart';

abstract class FirebaseAuthRepositoryI{
  Future<Either<Exception, User?>> singUp({required String email, required String password});
  Future<Map<String, dynamic>> signIn({required String email, required String password});
  Future<void> signOut();
  Future<bool> removeUser();
  User? getUser();
}