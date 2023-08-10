import 'package:ecommerce_demo/models/user_account/user_account.dart';
import 'package:ecommerce_demo/screens/user_account_screen/widgets/profile_details_item.dart';
import 'package:ecommerce_demo/services/user_account_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileDetails extends StatelessWidget {
  ProfileDetails({Key? key}) : super(key: key);

  UserAccountProvider? _userAccountProvider;
  UserAccount? _userAccount;

  @override
  Widget build(BuildContext context) {
    _userAccountProvider = Provider.of<UserAccountProvider>(context);
    _userAccount = _userAccountProvider?.userAccount;

    if (_userAccount == null) {
      return const CircularProgressIndicator();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProfileDetailsItem(
          label: 'Email',
          text: _userAccount!.email,
        ),
        ProfileDetailsItem(
          label: 'Street Address',
          text: _userAccount!.address,
        ),
        ProfileDetailsItem(
          label: 'ZIP Code',
          text: _userAccount!.zipCode,
        ),
        ProfileDetailsItem(
          label: 'Phone Number',
          text: _userAccount!.phoneNumber,
        ),
      ],
    );
  }
}

