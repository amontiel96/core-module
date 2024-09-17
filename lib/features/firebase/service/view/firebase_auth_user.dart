import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewFirebaseAuthStateChanges extends StatelessWidget {
  final Widget childWidget;
  final Function(User currentUser, String from) onLogin;
  final Function(String from) onLogout;
  final String from;

  const ViewFirebaseAuthStateChanges({super.key, required this.childWidget, required this.onLogin, required this.onLogout, required this.from, });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mostrar un indicador de carga mientras se obtiene el estado del usuario
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          print("amsdev user email: ${snapshot.requireData!.email}");
          // Si el usuario está autenticado, muestra el widget de inicio de sesión
          onLogin(snapshot.requireData!, from);
        } else {
          // Si el usuario no está autenticado, muestra el widget de inicio de sesión
          onLogout(from);
        }
        return childWidget;
      },
    );
  }
}

class ViewFirebaseAuthTokenChanges extends StatelessWidget {
  final Widget childWidget;
  final Function(User currentUser, String from) onLogin;
  final Function(String from) onLogout;
  final String from;

  const ViewFirebaseAuthTokenChanges({super.key, required this.childWidget, required this.onLogin, required this.onLogout, required this.from, });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.idTokenChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mostrar un indicador de carga mientras se obtiene el estado del usuario
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          print("amsdev user email: ${snapshot.requireData!.email}");
          // Si el usuario está autenticado, muestra el widget de inicio de sesión
          onLogin(snapshot.requireData!, from);
        } else {
          // Si el usuario no está autenticado, muestra el widget de inicio de sesión
          onLogout(from);
        }
        return childWidget;
      },
    );
  }
}

class ViewFirebaseAuthUserChanges extends StatelessWidget {
  final Widget childWidget;
  final Function(User currentUser, String from) onLogin;
  final Function(String from) onLogout;
  final String from;

  const ViewFirebaseAuthUserChanges({super.key, required this.childWidget, required this.onLogin, required this.onLogout, required this.from, });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mostrar un indicador de carga mientras se obtiene el estado del usuario
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          print("amsdev user email: ${snapshot.requireData!.email}");
          // Si el usuario está autenticado, muestra el widget de inicio de sesión
          onLogin(snapshot.requireData!, from);
        } else {
          // Si el usuario no está autenticado, muestra el widget de inicio de sesión
          onLogout(from);
        }
        return childWidget;
      },
    );
  }
}