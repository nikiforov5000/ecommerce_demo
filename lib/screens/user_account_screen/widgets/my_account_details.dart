import 'package:ecommerce_demo/screens/user_account_screen/widgets/edit_entry_icon.dart';
import 'package:ecommerce_demo/screens/user_account_screen/widgets/header.dart';
import 'package:ecommerce_demo/screens/user_account_screen/widgets/profile_details.dart';
import 'package:flutter/material.dart';

class MyAccountDetails extends StatelessWidget {
  const MyAccountDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 29),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Header(),
                EditEntryIcon(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ProfileDetails(),
          ],
        ),
      ),
    );
  }
}
