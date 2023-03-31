import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/constants/decorations.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/models/shopping_cart.dart';
import 'package:ecommerce_demo/screens/checkout_screen.dart';
import 'package:ecommerce_demo/widgets/buttonText.dart';
import 'package:ecommerce_demo/widgets/color_filtered_image.dart';
import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:ecommerce_demo/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    print('shopping_cart_screen.dart -> build');
    double total = shoppingCart.getSum();
    print('\t total:$total');
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        actions: [
          UserAvatarWidget(),
          LogoutButton(),
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
                  Product product =
                      shoppingCart.getCartMap().keys.elementAt(index);
                  return Container(
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 12,
                    ),
                    decoration: kButtonDecoration,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: ColorFilteredImage(imgUrl: product.imgUrl)),
                        Flexible(child: Text(product.getShortTitle())),
                        Flexible(flex: 1, child: Container()),
                        Flexible(
                          child: Column(
                            children: [
                              Expanded(
                                child: DropdownButton(
                                  value: shoppingCart.getCartMap()[product],
                                  items: List.generate(11, (index) {
                                    return DropdownMenuItem(
                                      child: Text(
                                        index.toString()),
                                        value: index,
                                    );
                                  }).getRange(1, 11).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      if (value != null) {
                                        shoppingCart.updateQty(
                                          product: product,
                                          qty: value as int,
                                        );
                                      }
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 10,),
                              Expanded(
                                child: RemoveButton(
                                  product: product,
                                  onTapCallback: (callback) {
                                    setState(() {
                                      callback;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
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

class RemoveButton extends StatelessWidget{
  RemoveButton({required this.product, required this.onTapCallback});
  final Function onTapCallback;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapCallback(shoppingCart.updateQty(product: product, qty: 0));
      },
      child: Text('Remove'),
    );
  }
}
