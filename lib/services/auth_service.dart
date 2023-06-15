import 'package:ecommerce_demo/models/user/local_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  LocalUser? _localUserFromFirebaseAuth(User? user) {
    if (user == null) {
      return null;
    }

    return LocalUser(
      uid: user.uid,
      email: user.email!,
    );
  }

  Stream<LocalUser?>? get user {
    return _firebaseAuth.authStateChanges().map(_localUserFromFirebaseAuth);
  }

  Future<LocalUser?> signInWithEmailAndPassword(
      String email, String password) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return _localUserFromFirebaseAuth(credential.user);
  }

  Future<LocalUser?> createUserWithEmailAndPassword(
      String email, String password) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _localUserFromFirebaseAuth(credential.user);
  }

  Future<LocalUser?> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await _firebaseAuth.signInWithCredential(credential);
      if (userCredential.additionalUserInfo!.isNewUser) {
        final currentUser = _firebaseAuth.currentUser;
        if (currentUser != null) {
          await currentUser.updateDisplayName(googleUser.displayName);
        }
        return _localUserFromFirebaseAuth(_firebaseAuth.currentUser);
      }
    }
    return null;
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
