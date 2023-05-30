import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/screens/order_summary/order_summary.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen/widgets/snapshot_stream_builder_widget.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen/widgets/total_price.dart';
import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:ecommerce_demo/widgets/buttonText.dart';
import 'package:ecommerce_demo/widgets/icon_template.dart';
import 'package:ecommerce_demo/widgets/logo_home_button.dart';
import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:ecommerce_demo/widgets/user_avatar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  static const String id = 'shopping_cart_screen';

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    final shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);
    final shoppingCart = shoppingCartProvider.shoppingCart;
    print('shopping_cart.dart -> _sum' + shoppingCart!.getSum().toString());
    shoppingCart?.fetchTotal();
    print('shopping_cart.dart -> _sum' + shoppingCart!.getSum().toString());
    return Scaffold(
      appBar: AppBar(
        title: const LogoHomeButton(),
        actions: [
          AppBarIconTemplate(child: UserAvatarWidget()),
          AppBarIconTemplate(child: LogoutButton()),
        ],
      ),
      body: Container(
        color: kBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
        Expanded(
          child: SnapshotStreamBuilderWidget(
            shoppingCart: shoppingCart,
          ),
        ),
        Container(
          height: 2,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: TotalPrice(),
        ),
        Container(
          height: 2,
          color: Colors.grey,
        ),
        RoundedButton(
          labelWidget: ButtonText(text: 'Next'),
          onTapCallback: () {
            Navigator.pushNamed(context, OrderSummary.id);
          },
        ),
          ],
        ),
      ),
    );
  }
}





