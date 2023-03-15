import 'package:flutter/material.dart';

import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user == null ? null : _user;

  set setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
