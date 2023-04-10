import 'package:ecommerce_demo/models/local_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  LocalUser? _localUserFromFirebaseAuth(User? user) {
    if (user == null) { return null; }

    return LocalUser(
      uid: user.uid,
      email: user.email!,
      displayName: user.displayName ?? '',
      photoUrl: user.photoURL ?? '',
    );
  }

  Stream<LocalUser?>? get user {
    return _firebaseAuth.authStateChanges().map(_localUserFromFirebaseAuth);
  }

  Future<LocalUser?> signInWithEmailAndPassword(
      String email, String password
      ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return _localUserFromFirebaseAuth(credential.user);
  }

  Future<LocalUser?> createUserWithEmailAndPassword(
      String email, String password
      ) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _localUserFromFirebaseAuth(credential.user);

  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}