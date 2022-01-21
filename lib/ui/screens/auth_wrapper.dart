import 'package:appandup_take_home/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context).authStateChanges;

    return StreamBuilder<User?>(
        stream: authService,
        builder: (_, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return HomePage();
          } else if (snapshot.hasError) {
            return Text('Error');
          } else {
            return AuthPage();
          }
        });

    //
    // final firebaseUser = context.watch<User?>();
    // if (firebaseUser != null) {
    //   return HomePage();
    // }
    // return AuthPage();
  }
}
