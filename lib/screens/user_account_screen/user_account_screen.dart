import 'package:ecommerce_demo/screens/user_account_screen/widgets/log_out_title.dart';
import 'package:ecommerce_demo/screens/user_account_screen/widgets/my_account_details.dart';
import 'package:ecommerce_demo/screens/user_account_screen/widgets/user_full_name.dart';
import 'package:ecommerce_demo/widgets/cart_icon/stream_builder.dart';
import 'package:ecommerce_demo/widgets/icon_template.dart';
import 'package:ecommerce_demo/widgets/logo_home_button.dart';
import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:flutter/material.dart';

class UserAccountScreen extends StatelessWidget {
  static const String id = 'user_account_screen';

  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoHomeButton(),
        actions: [
          AppBarIconTemplate(child: const CartIconStreamBuilder()),
          AppBarIconTemplate(child: LogoutButton()),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 10,
            ),
            UserFullNameTitle(),
            const LogoutTitle(),
            const SizedBox(
              height: 10,
            ),
            const MyAccountDetails(),
          ],
        ),
      ),
    );
  }
}
