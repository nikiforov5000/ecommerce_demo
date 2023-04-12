import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/constants/decorations.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/models/shoppint_cart/shopping_cart.dart';
import 'package:ecommerce_demo/screens/order_summary.dart';
import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:ecommerce_demo/widgets/buttonText.dart';
import 'package:ecommerce_demo/widgets/color_filtered_image.dart';
import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:ecommerce_demo/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  static const String id = 'shopping_cart_screen';

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    final _shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);
    final _shoppingCart = _shoppingCartProvider.shoppingCart;
    double total = _shoppingCart!.getSum();
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        actions: [
          UserAvatarWidget(),
          LogoutButton(),
        ],
      ),
      body: Container(
        color: kBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _shoppingCart.getSize(),
                itemBuilder: (BuildContext context, int index) {
                  Product product =
                      _shoppingCart.getCartMap().keys.elementAt(index);
                  return Container(
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    decoration: kButtonDecoration,
                    height: height * 0.15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: ColorFilteredImage(imgUrl: product.imgUrl)),
                        SizedBox(width: 10),
                        Flexible(
                          flex: 2,
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.getShortTitle()),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              product.title,
                              style: TextStyle(fontSize: 10.0),
                            ),
                          ],
                        )),
                        SizedBox(width: 10),

                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text(
                                    '\$' + product.price.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,

                                  children: [
                                    Text('Qty', style: TextStyle(fontSize: 13.0),),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    DropdownButton(
                                      underline: SizedBox(),
                                      value: _shoppingCart.getCartMap()[product],
                                      items: List.generate(11, (index) {
                                        return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          child: Container(
                                            margin: EdgeInsets.zero,
                                            child: Text(
                                              index.toString(),
                                              style: TextStyle(fontSize: 15.0),
                                            ),
                                          ),
                                          value: index,
                                        );
                                      }).getRange(1, 11).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          if (value != null) {
                                            _shoppingCart.updateQty(
                                              product: product,
                                              qty: value as int,
                                            );
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: RemoveButton(
                                  shoppingCart: _shoppingCart,
                                  product: product,
                                  onTapCallback: (callback) {
                                    setState(() {
                                      callback;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
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
              labelWidget: ButtonText(text: 'Next'),
              onTapCallback: () {
                Navigator.pushNamed(context, OrderSummary.id);
              },
            ),
          ],
        )),
      ),
    );
  }
}

class RemoveButton extends StatelessWidget {
  RemoveButton({required this.product, required this.onTapCallback, required this.shoppingCart});

  final Function onTapCallback;
  final Product product;
  final ShoppingCart shoppingCart;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapCallback(shoppingCart.updateQty(product: product, qty: 0));
      },
      child: Text('Remove', style: TextStyle(fontSize: 10),),
    );
  }
}
