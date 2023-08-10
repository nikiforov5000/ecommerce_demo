import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:ecommerce_demo/models/user_account/user_account.dart';
import 'package:ecommerce_demo/screens/user_account_screen/text_field_with_label.dart';
import 'package:ecommerce_demo/screens/user_account_screen/widgets/update_button.dart';
import 'package:ecommerce_demo/services/user_account_provider.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditDetailsBody extends StatelessWidget {
  EditDetailsBody({Key? key}) : super(key: key);
  UserAccountProvider? _userAccountProvider;
  UserAccount? _userAccount;

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  void fillControllers() {
    if (_userAccount != null) {
      _addressController.text = _userAccount!.address;
      _zipCodeController.text = _userAccount!.zipCode;
      _phoneNumberController.text = _userAccount!.phoneNumber;
    }
  }

  @override
  Widget build(BuildContext context) {
    _userAccountProvider = Provider.of<UserAccountProvider>(context);
    _userAccount = _userAccountProvider?.userAccount;

    fillControllers();

    return SafeArea(
      child: Column(
        children: [
          EditTextField(
            controller: _addressController,
            label: 'Address',
          ),
          EditTextField(
            controller: _zipCodeController,
            label: 'ZIP Code',
          ),
          EditTextField(
            controller: _phoneNumberController,
            label: 'Phone Number',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: UpdateButton(
                  userAccount: _userAccount,
                  addressController: _addressController,
                  zipCodeController: _zipCodeController,
                  phoneNumberController: _phoneNumberController,
                ),
              ),
              Flexible(
                child: RoundedButton(
                  labelWidget: const Text(
                    'Cancel',
                    style: kButtonTextStyle,
                  ),
                  onTapCallback: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

