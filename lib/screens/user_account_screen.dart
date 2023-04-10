import 'package:ecommerce_demo/models/local_user.dart';
import 'package:ecommerce_demo/services/local_user_provider.dart';
import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:ecommerce_demo/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserAccountScreen extends StatelessWidget {
  static String id = 'user_account_screen';
  LocalUser? _user;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<LocalUserProvider>(context);
    _user = userProvider.localUser;
    print(_user);

    return Scaffold(
      appBar: AppBar(
        title: Text(_user!.email),
        actions: [
          LogoutButton(),
          UserAvatarWidget(),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20.0,),
          Text('User Account'),
          _user != null
            ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                userInfo(),
                userProfileInput(),
              ]
            )
            : Text('_user is null'),
        ],
      ),
    );
  }

  userInfo() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_user!.uid),
          Text(_user!.email),
        ],
      ),
    );
  }

  userProfileInput() {
    TextEditingController nameController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    return Column(
      children: [
        TextField(
          controller: nameController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Enter your name',
          ),
        ),
        TextField(
          controller: addressController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Enter your address',
          ),
        ),
        RoundedButton(
          labelWidget: Text('Save'),
          onTapCallback: () {
            // _userProvider!.updateUserInfo({
            //   'name': nameController.text,
            //   'address': addressController.text,
            // });
          },
        ),
      ],
    );
  }
}
