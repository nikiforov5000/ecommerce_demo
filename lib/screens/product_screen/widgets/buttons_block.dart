import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/constants/decorations.dart';
import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen/shopping_cart_screen.dart';
import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:ecommerce_demo/widgets/buttonText.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonsBlock extends StatefulWidget {
  const ButtonsBlock(this._product, {Key? key}) : super(key: key);

  final Product _product;

  @override
  State<ButtonsBlock> createState() => _ButtonsBlockState();
}

class _ButtonsBlockState extends State<ButtonsBlock> {
  int quantity = 1;
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    final shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);
    final shoppingCart = shoppingCartProvider.shoppingCart;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                height: 50.0,
                margin: EdgeInsets.all(9),
                decoration: kButtonDecoration,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: const Icon(
                          Icons.remove,
                          color: kDarkTextColor,
                          size: 15,
                        ),
                        onTap: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity--;
                            }
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: Text(
                        quantity.toString(),
                        textAlign: TextAlign.center,
                        style: kProductScreenQuantityTextStyle,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: const Icon(
                          Icons.add,
                          color: kDarkTextColor,
                          size: 15,
                        ),
                        onTap: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: FutureBuilder(
                future: shoppingCart!.isProductInCart(widget._product),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  bool? data = snapshot.data;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (data! || isAdded) {
                    return RoundedButton(
                      labelWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.shopping_cart,
                            color: kDarkTextColor,
                          ),
                          ButtonText(text: ' Go to Cart'),
                        ],
                      ),
                      onTapCallback: () {
                        print('go to cart');
                        Navigator.pushNamed(context, ShoppingCartScreen.id);
                      },
                    );
                  } else {
                    return RoundedButton(
                      labelWidget: ButtonText(text: 'Add to Cart'),
                      onTapCallback: () {
                        setState(() {
                          isAdded = true;
                          print('add to cart');
                          shoppingCart.addProduct(widget._product, quantity);
                          Future.delayed(Duration(seconds: 3));
                        });
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
