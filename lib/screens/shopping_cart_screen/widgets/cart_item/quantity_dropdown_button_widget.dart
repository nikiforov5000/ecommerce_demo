import 'package:ecommerce_demo/models/shopping_cart/shopping_cart_item.dart';
import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuantityDropdownButtonWidget extends StatefulWidget {
  const QuantityDropdownButtonWidget({Key? key, required this.cartItem})
      : super(key: key);
  final ShoppingCartItem cartItem;

  @override
  State<QuantityDropdownButtonWidget> createState() =>
      QuantityDropdownButtonWidgetState();
}

class QuantityDropdownButtonWidgetState
    extends State<QuantityDropdownButtonWidget> {
  @override
  Widget build(BuildContext context) {
    var shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);
    var shoppingCart = shoppingCartProvider.shoppingCart;
    return DropdownButton(
      underline: const SizedBox(),
      value: widget.cartItem.quantity!,
      items: List.generate(11, (index) {
        return DropdownMenuItem(
          alignment: AlignmentDirectional.center,
          value: index,
          child: Container(
            margin: EdgeInsets.zero,
            child: Text(
              index.toString(),
              style: const TextStyle(fontSize: 15.0),
            ),
          ),
        );
      }).getRange(1, 11).toList(),
      onChanged: (value) {
        setState(() {
          if (value != null) {
            shoppingCart?.updateQty(cartItem: widget.cartItem, qty: value);
          }
        });
      },
    );
  }
}
