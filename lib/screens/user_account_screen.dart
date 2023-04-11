import 'package:cloud_firestore/cloud_firestore.dart';
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
  final phoneNumberController = TextEditingController();


  static fetchAccount({required String uid}) async {
    print('user_account.dart -> getUserAccount()');
    final firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('users').doc(uid).get().then((value) {
      print(value);
      return value;
    });
    print('user_account.dart -> snapshot is ready');
    if (snapshot.data() == null) { return null; }
    return _snapshotToUserAccount(snapshot.data()!);
  }

  static _snapshotToUserAccount(Map<String, dynamic> data) {
    print('user_account.dart -> _snapshotToUserAccount');
    final uid = data['uid'];
    final createdAt = (data['createdAt'] as Timestamp).toDate();
    final email = data['email'];
    final shoppingCartRef =
    data['shoppingCartRef'] as DocumentReference<Map<String, dynamic>>;

    String? phoneNumber = data['phoneNumber'];
    String? address = data['address'];
    DateTime? updatedAt = data['updatedAt'] != null
        ? (data['updatedAt'] as Timestamp).toDate()
        : null;

    return UserAccount(
      createdAt: createdAt,
      uid: uid,
      email: email,
      shoppingCartRef: shoppingCartRef,
      phoneNumber: phoneNumber,
      address: address,
      updatedAt: updatedAt,
    );
  }


  getUserAccount() async {
    print('user_account_screeen.dart -> getUserAccount()');
    _userAccount = await UserAccount.fetchAccount(uid: _user!.uid);
    print('\t' + _userAccount!.email);
    fillControllerText();

  }

  fillControllerText() async {
    print('user_account_screeen.dart -> fillControllerText()');

    print('\t' + _userAccount.toString());
    emailController.text = _userAccount!.email;
    addressController.text = _userAccount!.address ?? '';
    phoneNumberController.text = _userAccount!.phoneNumber ?? '';
  }

  @override
  Widget build(BuildContext context) {
    print('user_account_screeen.dart -> build()');

    final userProvider = Provider.of<LocalUserProvider>(context);
    _user = userProvider.localUser;

    getUserAccount();


    return Scaffold(
      appBar: AppBar(
        title: Text(_user == null ? 'null' : _user!.email),
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
                EditTextField(label: 'Phone number', controller: phoneNumberController),
                  ElevatedButton(
                    onPressed: () {
                      _userAccount!.update(
                        address: addressController.text,
                        phoneNumber: phoneNumberController.text,
                      );
                    },
                    child: Text('Update'),
                  ),
                ])
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
