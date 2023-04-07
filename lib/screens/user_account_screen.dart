import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:ecommerce_demo/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserAccountScreen extends StatelessWidget {
  static String id = 'user_account_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(user!.email),
        actions: [
          LogoutButton(),
          UserAvatarWidget(),
        ],
      ),
      body: Column(
        children: [
          Text('User Account'),
          // user != null
          //   ? Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       userInfo(),
          //       userProfileInput(),
          //     ]
          //   )
          //   : Text('user is null'),
        ],
      ),
    );
  }

  userInfo() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(user!.uid),
          // Text(user!.email),
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
