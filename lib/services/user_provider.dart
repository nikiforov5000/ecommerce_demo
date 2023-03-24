import 'package:flutter/material.dart';

import 'package:ecommerce_demo/models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user == null ? null : _user;



  set setUser(User user) {
    if(_user == null || _user!.uid != user.uid) {
      _user = user;
      notifyListeners();
    }
  }

  void setUserToNull() {
    _user = null;
    notifyListeners();
  }

}
