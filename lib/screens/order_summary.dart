import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/constants/shadows.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/models/shopping_cart.dart';
import 'package:ecommerce_demo/screens/checkout_screen.dart';
import 'package:ecommerce_demo/services/user_provider.dart';
import 'package:ecommerce_demo/widgets/bank_card.dart';
import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderSummary extends StatelessWidget {
  static const String id = 'order_summary';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final _userProvider = Provider.of<UserProvider>(context);
    final _user = _userProvider.user;
    return Scaffold(
      appBar: AppBar(
        actions: [
          UserAvatarWidget(),
          LogoutButton(),
        ],
      ),
      body: Container(
        // color: kBackgroundColor,
        child: Column(
          children: [
            Flexible(
              flex: 10,
              child: Container(
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:
                        List.generate(shoppingCart.length, (index) {
                          final product = shoppingCart.getCartMap().keys.toList()[index];
                          final int amount = shoppingCart.getCartMap().values.toList()[index];
                          final String priceDescription = amount.toString() + ' x ' + product.price.toString();
                          return Container(
                            decoration: BoxDecoration(
                              // color: kBackgroundColor,
                              // boxShadow: k3DShadows,
                            ),
                            height: height * 0.05,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(child: Image.network(product.imgUrl)),
                                Flexible(child: Text(product.title)),
                                Flexible(child: Text(priceDescription)),
                              ],
                            ),
                          );
                        }),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                color: Colors.blueGrey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Total: \$' + shoppingCart.getSum().toStringAsFixed(2), style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                color: Colors.greenAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Your details:'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Address:'),
                        Text('Caferağa, Moda Cd. No:10, 34710 Kadıköy/İstanbul'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 10,
              child: Container(
                color: Colors.purpleAccent.shade100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Payment method details:'),
                    BankCard(),
                  ],
                ),
              ),
            ),
            Flexible(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Pay'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
