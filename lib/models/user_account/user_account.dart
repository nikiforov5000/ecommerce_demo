import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/models/user/local_user.dart';
import 'package:flutter/foundation.dart';

class UserAccount extends ChangeNotifier{
  final String uid;
  final String email;
  final String cartId;
  final DateTime createdAt;
  DateTime? updatedAt;
  String? address;
  String? phoneNumber;

  UserAccount({
    required this.createdAt,
    required this.uid,
    required this.email,
    required this.cartId,
    this.phoneNumber,
    this.address,
    this.updatedAt,
  });

  static fetchAccount({required String uid}) async {
    print('user_account.dart -> fetchAccount() uid:$uid');
    try {
      final firestore = FirebaseFirestore.instance;
      final userRef = await firestore.collection('users').doc(uid).get();
      final data = userRef.data() ?? {};
      return await _snapshotToUserAccount(data);
    }
    catch (e) {
      print('user_account.dart -> fetchAccount() error:$e');
    }
  }

  static _snapshotToUserAccount(Map<String, dynamic> data) {
    final uid = data['uid'];
    final createdAt = (data['createdAt'] as Timestamp).toDate();
    final email = data['email'];
    final cartId = data['cartId'];

    String? phoneNumber = data['phoneNumber'];
    String? address = data['address'];
    DateTime? updatedAt = data['updatedAt'] != null
        ? (data['updatedAt'] as Timestamp).toDate()
        : null;

    return UserAccount(
      createdAt: createdAt,
      uid: uid,
      email: email,
      cartId: cartId,
      phoneNumber: phoneNumber,
      address: address,
      updatedAt: updatedAt,
    );
  }

  static createFirestoreUserAccount(LocalUser user, String cartId) async {
    return await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'createdAt': DateTime.now(),
      'email': user.email,
      'uid': user.uid,
      'cartId': cartId,
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