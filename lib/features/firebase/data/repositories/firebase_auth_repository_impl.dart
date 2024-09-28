import 'package:core_module/core_module.dart';
import 'package:core_module/features/firebase/domain/repositories/firebase_auth_repository.dart';
import 'package:dartz/dartz.dart';

class FirebaseAuthRepository implements FirebaseAuthRepositoryI{
  @override
  Future<Either<Exception, User?>> singUp({required String email, required String password}) async {
    try {

      print("amsdev llegar a metodo create user");
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //print('amsdev User created with uid: ${credential.user!.uid}');
      return Right(credential.user);
      //await credential.user?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('amsdev The password provided is too weak.');
        return Left(Exception('Password is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        print('amsdev The account already exists for that email.');
        return Left(Exception('The account already exists for that email.'));
      }
    } catch (e) {
      print(e);
    }
    return Left(Exception('Fallo al crear la cuenta'));
  }

  @override
  Future<FirebaseAuthCredentialsModel?> signIn({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return FirebaseAuthCredentialsModel(email,password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<bool> removeUser() async {
    if (FirebaseAuth.instance.currentUser != null) {
      print(FirebaseAuth.instance.currentUser?.uid);
      try {
        await FirebaseAuth.instance.currentUser?.delete();
        return true;
      }catch(e){
        return false;
      }
    }
    print("amsdev llega hasta el ultimo return false");
    return false;
  }

  @override
  User? getUser() {
    return FirebaseAuth.instance.currentUser;
  }

}