import 'package:ecommerce_demo/models/user_account/user_account.dart';
import 'package:ecommerce_demo/screens/order_summary/widgets/card_title.dart';
import 'package:ecommerce_demo/screens/order_summary/widgets/edit_title.dart';
import 'package:ecommerce_demo/screens/order_summary/widgets/line_text.dart';
import 'package:ecommerce_demo/screens/order_summary/widgets/line_title.dart';
import 'package:ecommerce_demo/screens/user_account_screen/user_account_screen.dart';
import 'package:flutter/material.dart';

class UserShippingDetails extends StatelessWidget {
  final UserAccount _userAccount;

  const UserShippingDetails(this._userAccount, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CardTitle('Shipping address'),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, UserAccountScreen.id);
                  },
                  child: const EditTitle(),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LineTitle('Name'),
                LineText(_userAccount.fullName),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LineTitle('Street'),
                LineText(_userAccount.address),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LineTitle('ZIP'),
                LineText(_userAccount.zipCode),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LineTitle('Phone no'),
                LineText(_userAccount.phoneNumber),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
