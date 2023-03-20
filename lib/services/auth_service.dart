import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

import 'package:ecommerce_demo/models/user.dart';

class AuthService {
  final _googleSignIn = GoogleSignIn();

  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(email: user.email!, uid: user.uid);
  }

  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  auth.User? get authUser {
    return _firebaseAuth.currentUser;
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebase(credential.user);
    }
      catch (e) {
        print('auth_service.dart -> signInWithEmailAndPassword:$e');
      }
  }

  Future<User?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebase(credential.user);
    }
    catch (e) {
      print('auth_service.dart -> createUserWithEmailAndPassword:$e');
    }
  }

  Future<void> signOut() async {
    try {
      return await _firebaseAuth.signOut();
    }
    catch (e) {
      print('auth_service.dart -> signOut:$e');
    }
  }

  Future<User?> signInWithGoogle() async {
    print('sign-in with google button');
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final credential = auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final userCredential =
            await _firebaseAuth.signInWithCredential(credential);
        if (userCredential != null
            && userCredential.additionalUserInfo != null
            && userCredential.additionalUserInfo!.isNewUser
            ) {
          final currentUser = _firebaseAuth.currentUser;
          if (currentUser != null) {
            await currentUser.updateDisplayName(googleUser.displayName);
            return _userFromFirebase(currentUser);
          }
        }
        print('all good, next is navigator');
      }
    } catch (e) {
      print('Error signing in with Google: $e');
    }
  }
}
