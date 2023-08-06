import 'package:ecommerce_demo/screens/categories_screen/categories_body.dart';
import 'package:ecommerce_demo/widgets/cart_icon/stream_builder.dart';
import 'package:ecommerce_demo/widgets/icon_template.dart';
import 'package:ecommerce_demo/widgets/logo_home_button.dart';
import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  static const String id = 'categories_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoHomeButton(),
        actions: [
          AppBarIconTemplate(child: const CartIconStreamBuilder()),
          AppBarIconTemplate(child: UserAvatarWidget()),
          AppBarIconTemplate(child: LogoutButton()),
        ],
      ),
      body: const CategoriesBody(),
    );
  }
}
