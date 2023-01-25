import 'package:flutter/material.dart';
import 'package:ecommerce_demo/models/shopping_cart.dart';

import '../models/product.dart';
import '../widgets/rounded_button_widget.dart';

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
    List<Product> products = shoppingCart.getCartMap().keys.toList();
    List<int> quantities = shoppingCart.getCartMap().values.toList();

    double total = shoppingCart.getSum();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: shoppingCart.getSize(),
                  itemBuilder: (BuildContext context, int index) {
                    int quantity =
                        shoppingCart.getCartMap().values.elementAt(index);
                    Product product =
                        shoppingCart.getCartMap().keys.elementAt(index);
                    return ListTile(
                      leading: Image(
                        image: NetworkImage(
                          product.imgUrl,
                        ),
                      ),
                      title: Text(product.getShortTitle()),
                      trailing: Text('x ' + quantity.toString()),
                    );
                    // return FittedBox(child: ProductTile(product: product, onTapCallback: () {},));
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
                text: 'Continue',
                color: Colors.blue,
                onPress: () {},
              ),
            ],
          )),
        ),
      ),
    );
  }
}
