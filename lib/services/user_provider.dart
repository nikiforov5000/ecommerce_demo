import 'package:flutter/material.dart';
import 'package:ecommerce_demo/models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User get user => _user!;

  set setUser(User user) {
    _user = user;
    notifyListeners();
  }
}