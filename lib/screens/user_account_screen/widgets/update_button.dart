import 'package:ecommerce_demo/models/user_account/user_account.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';


class UpdateButton extends StatelessWidget {
  const UpdateButton({
    required userAccount,
    required addressController,
    required zipCodeController,
    required phoneNumberController,
    Key? key,
  })  : _userAccount = userAccount,
        _addressController = addressController,
        _zipCodeController = zipCodeController,
        _phoneNumberController = phoneNumberController,
        super(key: key);

  final UserAccount _userAccount;
  final TextEditingController _addressController;
  final TextEditingController _zipCodeController;
  final TextEditingController _phoneNumberController;

  void update() {
    _userAccount.address = _addressController.text;
    _userAccount.phoneNumber = _phoneNumberController.text;
    _userAccount.zipCode = _zipCodeController.text;
    _userAccount.update();
  }

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      labelWidget: const Text('Update'),
      onTapCallback: () {
        update();
        Navigator.pop(context);
      },
    );
  }
}
