import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_demo/models/user.dart';

import '../models/user.dart';

class AuthService {
  final _googleSignIn = GoogleSignIn();

  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(email: user.email!, uid: user.uid);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signInWithEmailAndPassword(String email,
      String password,) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email, password: password,);
    return _userFromFirebase(credential.user);
  }

  Future<User?> createUserWithEmailAndPassword(String email,
      String password,) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email, password: password,);
    return _userFromFirebase(credential.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<User?> signInWithGoogle() async {
    print('sign-in with google button');
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final credential = auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken,);
        final userCredential = await _firebaseAuth.signInWithCredential(credential);
        if (userCredential.additionalUserInfo!.isNewUser) {
          final currentUser = _firebaseAuth.currentUser;
          if (currentUser != null) {
            await currentUser.updateDisplayName(googleUser.displayName);
            return _userFromFirebase(currentUser);
          }
        }
        print('all good, next is navigator');
      }
    } catch (e) {
      print(e);
    }
  }
}
