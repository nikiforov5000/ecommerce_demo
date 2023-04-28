import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/models/user/local_user.dart';
import 'package:ecommerce_demo/models/user_account/user_account.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen/shopping_cart_screen.dart';
import 'package:ecommerce_demo/services/local_user_provider.dart';
import 'package:ecommerce_demo/widgets/cart_icon/stream_builder.dart';
import 'package:ecommerce_demo/widgets/icon_template.dart';
import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
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


  UserAccountScreen({super.key});

  static fetchAccount({required String uid}) async {
    final firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('users').doc(uid).get();
    if (snapshot.data() == null) { return null; }
    return _snapshotToUserAccount(snapshot.data()!);
  }

  static _snapshotToUserAccount(Map<String, dynamic> data) {
    final uid = data['uid'];
    final createdAt = (data['createdAt'] as Timestamp).toDate();
    final email = data['email'];
    final cartId = data['cartId'];

    String? phoneNumber = data['phoneNumber'];
    String? address = data['address'];
    DateTime? updatedAt = data['updatedAt'] != null
        ? (data['updatedAt'] as Timestamp).toDate()
        : null;

    return UserAccount(
      createdAt: createdAt,
      uid: uid,
      email: email,
      cartId: cartId,
      phoneNumber: phoneNumber,
      address: address,
      updatedAt: updatedAt,
    );
  }

  getUserAccount() async {
    _userAccount = await UserAccount.fetchAccount(uid: _user!.uid);
    fillControllerText();
  }

  fillControllerText() async {
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
        title: Text('Your Account'),
        actions: [
          AppBarIconTemplate(child: CartIconStreamBuilder()),
          AppBarIconTemplate(child: LogoutButton()),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: _user != null
            ? Container(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0,),
                Text('User: ${_user?.email}'),
                EditTextField(label: 'Address', controller: addressController),
                EditTextField(label: 'Phone number', controller: phoneNumberController),
                  RoundedButton(
                    labelWidget: Text('Update'),
                    onTapCallback: () {
                      _userAccount!.update(
                        updatedAt: DateTime.now(),
                        address: addressController.text,
                        phoneNumber: phoneNumberController.text,
                      );
                    },
                  ),
                RoundedButton(
                  labelWidget: Text('My cart'),
                    onTapCallback: () {
                      Navigator.pushNamed(context, ShoppingCartScreen.id);
                    },
                  ),
                ]),
            )
            : Text('_user is null'),
      ),
    );
  }
}


class EditTextField extends StatelessWidget{

  final String label;
  final TextEditingController controller;
  const EditTextField({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: Row(
          children: [
            Text(label),
          ],
        )),
        Flexible(
          flex: 2,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter your ${label}',
              border: InputBorder.none
            ),
            controller: controller,
          ),
        ),
      ],
    );
  }
}
