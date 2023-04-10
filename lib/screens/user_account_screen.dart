import 'package:ecommerce_demo/models/user/local_user.dart';
import 'package:ecommerce_demo/models/user_account/user_account.dart';
import 'package:ecommerce_demo/services/local_user_provider.dart';
import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class UserAccountScreen extends StatelessWidget {
  static String id = 'user_account_screen';
  LocalUser? _user;
  UserAccount? _userAccount;

  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();



  getUserAccount() async {
    _userAccount = await UserAccount.getUserAccount(uid: _user!.uid);
  }

  fillControllerText() {

    emailController.text = _userAccount!.email;
    addressController.text = _userAccount!.address ?? '';
    fullNameController.text = _userAccount!.fullName ?? '';
    phoneNumberController.text = _userAccount!.phoneNumber ?? '';
  }

  @override
  Widget build(BuildContext context) {

    getUserAccount();

    fillControllerText();

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
                EditTextField(label: 'Email', controller: emailController),
                EditTextField(label: 'Address', controller: addressController),
                EditTextField(label: 'Full Name', controller: fullNameController),
              ]
          )
              : Text('_user is null'),
        ],
      ),
    );
  }
}


class EditTextField extends StatelessWidget{

  final String label;
  final TextEditingController controller;
  EditTextField({required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Flexible(child: Row(
          children: [
            Text(label),
          ],
        )),
        Flexible(flex: 2,child: TextField(controller: controller)),
      ],
    );
  }
}
