import 'package:ecommerce_demo/models/product_data.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../models/shopping_cart.dart';
import '../widgets/rounded_button_widget.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  static const String id = 'shopping_cart_screen';

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();



}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  ShoppingCart shoppingCart = ShoppingCart();

  @override
  void initState() {
    shoppingCart.addProduct(productData.getProduct(0), 3);
    shoppingCart.addProduct(productData.getProduct(4), 6);
    shoppingCart.addProduct(productData.getProduct(6), 1);
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
                    Text(total.toStringAsFixed(2), style: TextStyle(fontWeight: FontWeight.bold),),
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
