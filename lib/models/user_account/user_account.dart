
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserAccount extends ChangeNotifier{
  final String uid;
  final String email;
  final String shoppingCartId;
  final String? displayName;
  final String? photoUrl;
  final String? address;
  final String? fullName;
  final String? phoneNumber;
  final DateTime createdAt;
  final DateTime updatedAt;
  List<String>? orders;
  List<String>? wishlist;
  List<String>? cart;

  UserAccount({
    required this.createdAt,
    required this.updatedAt,
    required this.uid,
    required this.email,
    required this.shoppingCartId,
    this.address,
    this.fullName,
    this.phoneNumber,
    this.displayName,
    this.photoUrl,
    this.cart,
    this.orders,
    this.wishlist,
  });

  static getUserAccount({required String uid}) async {
    final firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('users').doc(uid).get();
    if (snapshot.data() == null) { return null; }
    return _snapshotToUserAccount(snapshot.data()!);
  }

  static _snapshotToUserAccount(Map<String, dynamic> data) {

    final uid = data['uid'];
    final createdAt = data['createdAt'];
    final updatedAt = data['updatedAt'];
    final email = data['email'];
    final shoppingCartId = data['shoppingCartId'];
    String? address = data['address'];
    String? fullName = data['fullName'];
    String? phoneNumber = data['phoneNumber'];
    String? displayName = data['displayName'];
    String? photoUrl = data['photoUrl'];
    List<String>? cart = data['cart'];
    List<String>? orders = data['orders'];
    List<String>? wishlist = data['wishlist'];

    return UserAccount(
    uid: uid,
    createdAt: createdAt,
    updatedAt: updatedAt,
    email: email,
    shoppingCartId: shoppingCartId,
    address: address,
    fullName: fullName,
    phoneNumber: phoneNumber,
    displayName: displayName,
    photoUrl: photoUrl,
    cart: cart,
    orders: orders,
    wishlist: wishlist,
    );

  }
}