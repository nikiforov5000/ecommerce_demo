import 'package:ecommerce_demo/models/user_account/user_account.dart';
import 'package:flutter/material.dart';

class UserAccountProvider with ChangeNotifier {
  UserAccount? _userAccount;

  UserAccount? get userAccount => _userAccount;

  set userAccount(UserAccount? userAccount) {
    _userAccount = userAccount;
    notifyListeners();
  }
}