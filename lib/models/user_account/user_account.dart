import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/models/user/local_user.dart';
import 'package:flutter/foundation.dart';

class UserAccount extends ChangeNotifier{
  final String uid;
  final String email;
  final DocumentReference<Map<String, dynamic>> shoppingCartRef;
  final DateTime createdAt;
  DateTime? updatedAt;
  String? address;
  String? phoneNumber;

  UserAccount({
    required this.createdAt,
    required this.uid,
    required this.email,
    required this.shoppingCartRef,
    this.phoneNumber,
    this.address,
    this.updatedAt,
  });

  static fetchAccount({required String uid}) async {
    final firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('users').doc(uid).get();
    if (snapshot.data() == null) { return null; }
    return _snapshotToUserAccount(snapshot.data()!);
  }

  static _snapshotToUserAccount(Map<String, dynamic> data) {
    final uid = data['uid'];
    final createdAt = (data['createdAt'] as Timestamp).toDate();
    final email = data['email'];
    final shoppingCartRef =
        data['shoppingCartRef'] as DocumentReference<Map<String, dynamic>>;

    String? phoneNumber = data['phoneNumber'];
    String? address = data['address'];
    DateTime? updatedAt = data['updatedAt'] != null
        ? (data['updatedAt'] as Timestamp).toDate()
        : null;

    return UserAccount(
      createdAt: createdAt,
      uid: uid,
      email: email,
      shoppingCartRef: shoppingCartRef,
      phoneNumber: phoneNumber,
      address: address,
      updatedAt: updatedAt,
    );
  }

  static void createFirestoreUserAccount(LocalUser user, DocumentReference cartRef) async {
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'createdAt': DateTime.now(),
      'email': user.email,
      'uid': user.uid,
      'shoppingCartRef': cartRef,
    });
  }

  void update({required String address, required String phoneNumber, required DateTime updatedAt}) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'address': address,
      'phoneNumber': phoneNumber,
      'updatedAt': updatedAt,
    });
  }
}