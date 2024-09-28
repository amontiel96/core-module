import 'dart:async';

import 'package:core_module/core_module.dart';
import 'package:core_module/features/firebase/domain/repositories/firebase_email_verification_repository.dart';

class FirebaseEmailVerificationRepositoryImpl implements FirebaseEmailVerificationRepository{
  Timer? _emailVerificationTimer;
  @override
  void startEmailVerificationListener({int timeoutSeconds = 5}) {
    print("amsdev llega a iniciar el timer verificaction");
    _emailVerificationTimer = Timer.periodic(Duration(seconds: 5), (timer) async {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await user.reload(); // Recargar los datos del usuario
        user = FirebaseAuth.instance.currentUser;

        if (user!.emailVerified) {
          print('amsdev El email ha sido verificado');
          _emailVerificationTimer?.cancel(); // Detener el timer una vez verificado
          // Aquí puedes realizar acciones como navegar a otra pantalla
        } else {
          //print('amsdev El email aún no ha sido verificado');
        }
      } else {
        //print('amsdev No hay un usuario autenticado');
        _emailVerificationTimer?.cancel(); // Detener el timer si no hay usuario
      }
    });
  }

  @override
  void stopEmailVerificationListener() {
    _emailVerificationTimer?.cancel();
  }

}