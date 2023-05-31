import 'package:ecommerce_demo/models/shopping_cart/shopping_cart.dart';
import 'package:ecommerce_demo/screens/order_success/constants.dart';
import 'package:ecommerce_demo/screens/order_success/widgets/big_and_small_text_column.dart';
import 'package:ecommerce_demo/screens/order_success/widgets/circle_check_icon_widget.dart';
import 'package:ecommerce_demo/screens/order_success/widgets/small_text.dart';
import 'package:ecommerce_demo/screens/product_list_screen/products_list_screen.dart';
import 'package:ecommerce_demo/screens/user_account_screen/user_account_screen.dart';
import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class OrderSuccessScreen extends StatelessWidget {
  static const String id = 'order_success_screen';
  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final _shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);
    final _shoppingCart = _shoppingCartProvider.shoppingCart;

    final total = _shoppingCart!.getSum();
    final itemsAmount = _shoppingCart.getAmount();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 20.0, right: 20.0, top: 30.0, bottom: 30.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: height * 0.035),
                      height: height * 0.3,
                      decoration: BoxDecoration(
                          color: kCardBackgroundColor,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: height * 0.055,
                                bottom: height * 0.02,
                                left: width * 0.06,
                                right: width * 0.06,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: BigAndSmallTextColumn(
                                      'Thank for you order',
                                      'The order confirmation '
                                          'has been sent to your email address.',
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigAndSmallTextColumn(
                                          '\$${total.toStringAsFixed(2)}', 'Total amount'),
                                      BigAndSmallTextColumn(
                                          'x$itemsAmount', 'Items ordered'),
                                      BigAndSmallTextColumn(
                                          '4 - 6 days', 'Est. Delivery'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: kCardLightBackgroundColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0),
                                ),
                              ),
                              child: Center(
                                child: SmallText(
                                    'Please go to Account > Orders '
                                    '> Delivery Status\nto check the status'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CircleCheckIconWidget(),
                  ],
                ),
              ],
            ),
          ),
          RoundedButton(
            labelWidget: Text('Go to products'),
            onTapCallback: () {
              Navigator.pushNamed(context, ProductsListScreen.id);
            },
          ),
          RoundedButton(
            labelWidget: Text('Go to my account'),
            onTapCallback: () {
              Navigator.pushNamed(context, UserAccountScreen.id);
            },
          ),
        ],
      ),
    );
  }
}



