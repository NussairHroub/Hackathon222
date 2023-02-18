import 'package:firebase_auth/firebase_auth.dart';

import '../models/auth_user_model.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// user object based on FirebaseUser
  AuthUserModel? _userFirebaseUser(User? user) {
    return user != null ? AuthUserModel(uid: user.uid) : null;
  }

// auth change user stream
  Stream<AuthUserModel?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFirebaseUser(user));
  }

// Anonymous sign in
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;

      return _userFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;

      return _userFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  // create new account
  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      return _userFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  // reset password via email
  Future sendPasswordResetEmail(String email) async {
    try {
      _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }

  Future<String> getCurrentUserId() async {
    AuthUserModel? userModel = await user.first;

    return userModel!.uid;
  }
}
