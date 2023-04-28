import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:ecommerce_demo/widgets/cart_icon/create_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartIconStreamBuilder extends StatelessWidget {
  const CartIconStreamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<ShoppingCartProvider>(context);
    final cart = cartProvider.shoppingCart;
    return StreamBuilder<int>(
      stream: cart!.isNotEmptyStream(),
      initialData: 0,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data! > 0) {
          int amount = snapshot.data!;
          return CreateIcon(amount: amount);
        }
        return Container();
      },
    );
  }
}
