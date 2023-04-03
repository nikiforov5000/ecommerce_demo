import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_demo/models/user.dart';

class UserProvider with ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  User? _user;

  User? get user => _user == null ? null : _user;

  Future<String> get getAddress async {
    final snapshot = await _firestore
        .collection('users')
        .doc(_user!.uid)
        .get();
    final userData = snapshot.data();
    return userData!['address'];
  }

  set setUser(User user) {
    try {
      if(_user == null || _user!.uid != user.uid) {
        _user = user;
        notifyListeners();
      }
    }
    catch (e) {
      print(e);
    }
  }

  void setUserToNull() {
    if (_user != null) {
      _user = null;
      notifyListeners();
    }
  }

  saveUserInFirestore(User user) async {
    setUser = user;
    final _firestore = FirebaseFirestore.instance;
    await _firestore.collection('users').doc(user.uid).set({
      'email': user.email,
    }).then(
      (userSnapshot) => userSnapshot,
      onError: (e) => print('user_provider.dart -> error:$e'),
    );
  }

  updateUserInfo(Map<String, dynamic> updates) {
    final userRef = _firestore.collection('users').doc(user!.uid);
    userRef.update(updates);
  }

}
