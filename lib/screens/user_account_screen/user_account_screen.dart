import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/models/user/local_user.dart';
import 'package:ecommerce_demo/models/user_account/user_account.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen/shopping_cart_screen.dart';
import 'package:ecommerce_demo/screens/user_account_screen/text_field_with_label.dart';
import 'package:ecommerce_demo/services/local_user_provider.dart';
import 'package:ecommerce_demo/widgets/cart_icon/stream_builder.dart';
import 'package:ecommerce_demo/widgets/icon_template.dart';
import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserAccountScreen extends StatelessWidget {
  static String id = 'user_account_screen';
  LocalUser? _user;
  UserAccount? _userAccount;

  final zipCodeController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();

  UserAccountScreen({super.key});

  fillControllerText() async {
    zipCodeController.text = _userAccount?.zipCode ?? '';
    nameController.text = _userAccount?.fullName ?? '';
    addressController.text = _userAccount!.address ?? '';
    phoneNumberController.text = _userAccount!.phoneNumber ?? '';
  }

  @override
  Widget build(BuildContext context) {
    print('user_account_screeen.dart -> build()');

    final userProvider = Provider.of<LocalUserProvider>(context);
    _user = userProvider.localUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Account'),
        actions: [
          AppBarIconTemplate(child: CartIconStreamBuilder()),
          AppBarIconTemplate(child: LogoutButton()),
        ],
      ),
      body: Container(
          color: kBackgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('User: ${_user?.email}'),
                FutureBuilder(
                  future: UserAccount.fetchAccount(uid: _user!.uid),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      _userAccount = snapshot.data as UserAccount?;
                      fillControllerText();
                      return Column(
                        children: [
                          EditTextField(
                            label: 'Address',
                            controller: addressController,
                          ),
                          EditTextField(
                            label: 'ZIP Code',
                            controller: zipCodeController,
                          ),
                          EditTextField(
                            label: 'Full Name',
                            controller: nameController,
                          ),
                          EditTextField(
                            label: 'Phone number',
                            controller: phoneNumberController,
                          ),
                        ],
                      );
                    }
                  },
                ),
                RoundedButton(
                  labelWidget: Text('Update'),
                  onTapCallback: () {
                    _userAccount!.update(
                      address: addressController.text,
                      phoneNumber: phoneNumberController.text,
                      fullName: nameController.text,
                      zipCode: zipCodeController.text,
                    );
                  },
                ),
                RoundedButton(
                  labelWidget: Text('My cart'),
                  onTapCallback: () {
                    Navigator.pushNamed(context, ShoppingCartScreen.id);
                  },
                ),
              ],
          ),
      ),
    );
  }
}
