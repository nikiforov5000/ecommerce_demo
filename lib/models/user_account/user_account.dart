import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/models/user/local_user.dart';
import 'package:ecommerce_demo/utils/is_not_null_and_not_empty.dart';
import 'package:flutter/foundation.dart';

class Address {
  String? streetAddress;
  String? zipCode;
}

class UserAccount extends ChangeNotifier {
  final String uid;
  final String email;
  final String cartId;
  final DateTime? createdAt;
  DateTime? updatedAt;
  String? _address;
  String? _phoneNumber;
  String? _fullName;
  String? _zipCode;

  UserAccount(
      {this.createdAt,
      required this.uid,
      required this.email,
      required this.cartId,
      this.updatedAt,
      phoneNumber,
      address,
      fullName,
      zipCode})
      : _address = address,
        _phoneNumber = phoneNumber,
        _fullName = fullName,
        _zipCode = zipCode;

  String? get fullName => _fullName;

  String get address => _address ?? '';

  String get zipCode => _zipCode ?? '';

  String get phoneNumber => _phoneNumber ?? '';

  set address(String newAddress) {
    if (newAddress.isNotEmpty) {
      _address = newAddress;
    }
  }

  set zipCode(String newZipCode) {
    if (newZipCode.isNotEmpty) {
      _zipCode = newZipCode;
    }
  }

  set phoneNumber(String newPhoneNumber) {
    if (newPhoneNumber.isNotEmpty) {
      _phoneNumber = newPhoneNumber;
    }
  }

  static Stream<UserAccount> userAccountStream({required String uid}) {
    final firestore = FirebaseFirestore.instance;
    final userRef = firestore.collection('users').doc(uid);

    return userRef.snapshots().map((snapshot) {
      final data = snapshot.data();
      return _snapshotToUserAccount(data as Map<String, dynamic>);
    });
  }

  static fetchAccount({required String uid}) async {
    print('user_account.dart -> fetchAccount() uid:$uid');
    try {
      final firestore = FirebaseFirestore.instance;
      final userRef = await firestore.collection('users').doc(uid).get();
      final data = userRef.data() ?? {};
      return await _snapshotToUserAccount(data);
    } catch (e) {
      print('user_account.dart -> fetchAccount() error:$e');
    }
  }

  static _snapshotToUserAccount(Map<String, dynamic> data) {
    final uid = data['uid'];
    final createdAt = data['createdAt'] == null
        ? null
        : (data['createdAt'] as Timestamp).toDate();
    final email = data['email'];
    final cartId = data['cartId'];

    String? phoneNumber = data['phoneNumber'];
    String? address = data['address'];
    String? zipCode = data['zipCode'];
    String? fullName = data['fullName'];
    DateTime? updatedAt = data['updatedAt'] != null
        ? (data['updatedAt'] as Timestamp).toDate()
        : null;

    return UserAccount(
      createdAt: createdAt,
      uid: uid,
      email: email,
      fullName: fullName,
      zipCode: zipCode,
      cartId: cartId,
      phoneNumber: phoneNumber,
      address: address,
      updatedAt: updatedAt,
    );
  }

  static createFirestoreUserAccount(LocalUser user, String cartId) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set({
      'createdAt': DateTime.now(),
      'email': user.email,
      'uid': user.uid,
      'cartId': cartId,
    });
  }

  void update() async {
   await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'address': _address,
      'phoneNumber': _phoneNumber,
      'zipCode': _zipCode,
      'fullName': _fullName,
      'updatedAt': DateTime.now(),
    });
  }

  bool hasShippingDetails() {
    return isNotNullAndNotEmpty(_address) &&
        isNotNullAndNotEmpty(_phoneNumber) &&
        isNotNullAndNotEmpty(_zipCode) &&
        isNotNullAndNotEmpty(_fullName);
  }
}
