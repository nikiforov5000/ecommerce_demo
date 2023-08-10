import 'package:ecommerce_demo/models/user_account/user_account.dart';
import 'package:ecommerce_demo/services/user_account_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserFullNameTitle extends StatelessWidget {
  UserAccount? _userAccount;
  String? _fullName;

  @override
  Widget build(BuildContext context) {
    UserAccountProvider userAccountProvider =
    Provider.of<UserAccountProvider>(context);
    _userAccount = userAccountProvider.userAccount;
    _fullName = _userAccount?.fullName;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        '$_fullName',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

