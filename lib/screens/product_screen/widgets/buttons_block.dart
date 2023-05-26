import 'package:ecommerce_demo/constants/colors.dart';
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

  @override
  Widget build(BuildContext context) {
    final shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);
    final shoppingCart = shoppingCartProvider.shoppingCart;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Expanded(
              child: RoundedButton(
                labelWidget: const Icon(
                  Icons.remove,
                  color: kDarkTextColor,
                  size: 15,
                ),
                onTapCallback: () {
                  setState(() {
                    if (quantity > 1) {
                      quantity--;
                    }
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Text(
                quantity.toString(),
                style: kProductScreenQuantityTextStyle,
              ),
            ),
            Expanded(
              child: RoundedButton(
                labelWidget: const Icon(
                  Icons.add,
                  color: kDarkTextColor,
                  size: 15,
                ),
                onTapCallback: () {
                  setState(() {
                    quantity++;
                  });
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ],
        ),
        RoundedButton(
          labelWidget: ButtonText(text: 'Add to Cart'),
          onTapCallback: () {
            shoppingCart!.addProduct(widget._product, quantity);
          },
        ),
        RoundedButton(
          labelWidget: ButtonText(text: 'Go to Cart'),
          onTapCallback: () {
            Navigator.pushNamed(context, ShoppingCartScreen.id);
          },
        ),
      ],
    );
  }
}
