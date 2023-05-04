import 'package:ecommerce_demo/models/shopping_cart/shopping_cart.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen/shopping_cart_screen.dart';
import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:ecommerce_demo/widgets/cart_icon/create_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartIconStreamBuilder extends StatelessWidget {
  const CartIconStreamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<ShoppingCartProvider>(context);
    final ShoppingCart? cart = cartProvider.shoppingCart;
    return StreamBuilder<int>(
      stream: cart?.isNotEmptyStream(),
      initialData: 0,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data! > 0) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ShoppingCartScreen.id);
            },
            child: const CreateIcon(),
          );
        }
        return Container();
      },
    );
  }
}
