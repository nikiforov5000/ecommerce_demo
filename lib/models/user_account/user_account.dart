import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/models/user/local_user.dart';
import 'package:ecommerce_demo/services/local_user_provider.dart';
import 'package:flutter/foundation.dart';

class UserAccount extends ChangeNotifier{
  final String uid;
  final String email;
  final String shoppingCartRef;

  UserAccount({
    required this.uid,
    required this.email,
    required this.shoppingCartRef,

  });

  static getUserAccount({required String uid}) async {
    final firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('users').doc(uid).get();
    if (snapshot.data() == null) { return null; }
    return _snapshotToUserAccount(snapshot.data()!);
  }

  static _snapshotToUserAccount(Map<String, dynamic> data) {

    final uid = data['uid'];
    final email = data['email'];
    final shoppingCartRef = data['shoppingCartRef'];

    return UserAccount(
      uid: uid,
      email: email,
      shoppingCartRef: shoppingCartRef,
    );

  }

  static void createFirestoreUserAccount(LocalUser user, DocumentReference cartRef) async {

    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'email': user.email,
      'uid': user.uid,
      'shoppingCartRef': cartRef,
    });
    // userRef.set({'df':'j'});

  }
}