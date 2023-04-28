import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
class CartIconStreamBuilder extends StatefulWidget {
  const CartIconStreamBuilder({Key? key}) : super(key: key);

  @override
  State<CartIconStreamBuilder> createState() => _CartIconStreamBuilderState();
}

class _CartIconStreamBuilderState extends State<CartIconStreamBuilder> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<ShoppingCartProvider>(context);
    final cart = cartProvider.shoppingCart;


          // return CreateIcon();
    return StreamBuilder<int>(
      stream: cart!.isNotEmptyStream().debounceTime(Duration(seconds: 1)),
      initialData: 0,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data! > 0) {
          int amount = snapshot.data!;
          return CreateIcon(amount: amount);
        }
        return Container();
      }
    );
  }
}


class CreateIcon extends StatelessWidget {
  final amount;
  CreateIcon({required this.amount});
  TextStyle style = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleCartIcon(),
      ]
    );
  }
}

class CircleCartIcon extends StatelessWidget {
  const CircleCartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.greenAccent,
        radius: 21,
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

