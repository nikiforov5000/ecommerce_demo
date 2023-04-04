import 'package:ecommerce_demo/models/shopping_cart.dart';
import 'package:ecommerce_demo/screens/products_list_screen.dart';
import 'package:ecommerce_demo/screens/user_account_screen.dart';
import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:ecommerce_demo/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
class OrderSuccessScreen extends StatelessWidget {
  static const String id = 'order_success_screen';
  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const kBigFontTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xff20482F));
    TextStyle kSmallFontTextStyle = TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.5));
    final height = MediaQuery.of(context).size.height;
    final total = shoppingCart.getSum();
    final itemsAmount = shoppingCart.getAmount();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0, bottom: 30.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: height * 0.040),
                      height: height * 0.3,
                      decoration: BoxDecoration(
                        color: Color(0xff95E7BB),
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.only(top: height * 0.06,),

                              child: Column(
                                children: [
                                  Flexible(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Thank for you order',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: height * 0.06),
                                          child: Text(
                                            'The order confirmation has been sent to your email address.',
                                            textAlign: TextAlign.center,
                                            style: kSmallFontTextStyle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: height * 0.05,),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                '\$$total',
                                                style: kBigFontTextStyle,
                                              ),
                                              Text(
                                                'Total amount',
                                                style: kSmallFontTextStyle,
                                              )
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'x$itemsAmount',
                                                style: kBigFontTextStyle,
                                              ),
                                              Text(
                                                'Items ordered',
                                                style: kSmallFontTextStyle,
                                              )
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                '4 - 6 days',
                                                style: kBigFontTextStyle,
                                              ),
                                              Text(
                                                'Est. Delivery',
                                                style: kSmallFontTextStyle,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,)
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xffB1EDCD),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Please go to Account > Orders > Delivery Status\nto check the status', textAlign: TextAlign.center,
                                  style: kSmallFontTextStyle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.check_rounded,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xff95E7BB),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.check_rounded,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
