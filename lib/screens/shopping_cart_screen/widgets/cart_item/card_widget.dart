import 'package:ecommerce_demo/constants/decorations.dart';
import 'package:ecommerce_demo/models/shopping_cart/shopping_cart_item.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen/widgets/cart_item/info_section.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen/widgets/cart_item/image_widget.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen/widgets/cart_item/price_widget.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen/widgets/cart_item/quantity_dropdown_button_widget.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen/widgets/cart_item/remove_button_widget.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final ShoppingCartItem cartItem;
  const CardWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      decoration: kButtonDecoration,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CartItemImageWidget(cartItem: cartItem),
          const SizedBox(width: 10),
          Flexible(
            flex: 2,
            child: InfoSection(cartItem: cartItem),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CartItemPriceWidget(cartItem: cartItem),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('Qty', style: TextStyle(fontSize: 13.0)),
                      const SizedBox(width: 10.0),
                      QuantityDropdownButtonWidget(cartItem: cartItem),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                RemoveButtonWidget(cartItem: cartItem),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


