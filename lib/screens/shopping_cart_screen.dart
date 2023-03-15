// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/constants/decorations.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/models/shopping_cart.dart';
import 'package:ecommerce_demo/screens/checkout_screen.dart';
import 'package:ecommerce_demo/services/auth_service.dart';
import 'package:ecommerce_demo/services/user_provider.dart';
import 'package:ecommerce_demo/widgets/buttonText.dart';
import 'package:ecommerce_demo/widgets/color_filtered_image.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  static const String id = 'shopping_cart_screen';

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  void initState() {
    super.initState();
  }


  // void getCurrentUser() async {
  //   try {
  //     final user = await _auth.currentUser!;
  //     if (user != null) {
  //       loggedInUser = user;
  //       print(loggedInUser!.email);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    List<Product> products = shoppingCart.getCartMap().keys.toList();
    List<int> quantities = shoppingCart.getCartMap().values.toList();

    // final authService = Provider.of<AuthService>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    double total = shoppingCart.getSum();
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        actions: [
          InkWell(
            // todo this should be an avatar
            child: Center(
                child: Text(
              'logout',
              style: TextStyle(color: Colors.black),
            )),
            onTap: () {
              print(user!.email);
              // authService.signOut();
            },
          )
        ],
      ),
      body: Container(
        color: kBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: shoppingCart.getSize(),
                itemBuilder: (BuildContext context, int index) {
                  int quantity =
                      shoppingCart.getCartMap().values.elementAt(index);
                  Product product =
                      shoppingCart.getCartMap().keys.elementAt(index);
                  return Container(
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                    decoration: kButtonDecoration,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: ColorFilteredImage(product: product),
                        ),
                        Flexible(child: Text(product.getShortTitle())),
                        Flexible(flex: 1, child: Container()),
                        Flexible(child: Text('x ' + quantity.toString())),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 2,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total price: '),
                  Text(
                    total.toStringAsFixed(2),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              height: 2,
              color: Colors.grey,
            ),
            RoundedButton(
              labelWidget: ButtonText(text: 'Checkout'),
              onTapCallback: () {
                Navigator.pushNamed(context, CheckoutScreen.id);
              },
            ),
          ],
        )),
      ),
    );
  }
}
