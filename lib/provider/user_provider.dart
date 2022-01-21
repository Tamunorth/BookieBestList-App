import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  late final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Signed in';
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return '${e.message}  + dd';
    }
  }

  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Future<String?> updateImage(
  //     {required String email, required String password}) async {
  //   try {
  //     await _firebaseAuth.
  //     return "signed Up";
  //   } on FirebaseAuthException catch (e) {
  //     return e.message;
  //   }
  // }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

class GoogleSignInService extends ChangeNotifier {
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  // late final FirebaseAuth _firebaseAuth;
  // Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
  }
}
