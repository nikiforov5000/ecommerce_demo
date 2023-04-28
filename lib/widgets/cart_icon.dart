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
    return StreamBuilder<bool>(
      stream: cart!.isNotEmptyStream().debounceTime(Duration(seconds: 1)),
      initialData: false,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data == true) {
          return CreateIcon();
        }
        return Container();
      }
    );
  }
}


class CreateIcon extends StatelessWidget {
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

