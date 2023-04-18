import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/constants/decorations.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/models/shoppint_cart/shopping_cart.dart';
import 'package:ecommerce_demo/models/shoppint_cart/shopping_cart_item.dart';
import 'package:ecommerce_demo/screens/order_summary.dart';
import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:ecommerce_demo/widgets/buttonText.dart';
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
    print('shopping_cart_screen -> shoppingCart.id:' + _shoppingCart!.id);
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
              child: SnapshotStreamBuilder(shoppingCart: _shoppingCart,),
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

class SnapshotStreamBuilder extends StatelessWidget {
  final ShoppingCart shoppingCart;
  const SnapshotStreamBuilder({super.key, required this.shoppingCart});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('carts')
          .doc(shoppingCart.id)
          .collection('cartItems')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return const CircularProgressIndicator();
        }
        // final List<DocumentSnapshot> documents = snapshot.data?.docs.toList();
        return CartItemsListViewBuilder(snapshot: snapshot,);
      },
    );
  }
}

class CartItemsListViewBuilder extends StatelessWidget {
  final AsyncSnapshot<QuerySnapshot<Object?>> snapshot;
  
  const CartItemsListViewBuilder({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    // return Placeholder(
    //   child: Text(snapshot.data!.docs.first.data().toString()),
    // );
    return ListView.builder(
      itemCount: snapshot.data!.docs.length,
      itemBuilder: (BuildContext context, int index) {
        var cartItem = ShoppingCartItem.fromFirestore(snapshot.data!.docs[index].data() as Map<String, dynamic>);
        return CartListViewItemCard(cartItem: cartItem);
      },
    );
  }
  // Widget build(BuildContext context) {
  //   // return ListView.builder(
  //   //   itemCount: snapshot.data!.size,
  //   //   itemBuilder: (BuildContext context, int index) {
  //   //     final cartItem = ShoppingCartItem.fromFirestore(snapshot.data![index]);
  //   //     return Container(
  //   //       margin: EdgeInsets.only(bottom: 15),
  //   //       padding: EdgeInsets.symmetric(
  //   //         horizontal: 12,
  //   //         vertical: 12,
  //   //       ),
  //   //       decoration: kButtonDecoration,
  //   //       height: MediaQuery.of(context).size.height * 0.15,
  //   //       child: Row(
  //   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //   //         crossAxisAlignment: CrossAxisAlignment.start,
  //   //         children: [
  //   //           Flexible(
  //   //               flex: 2,
  //   //               child: Column(
  //   //                 mainAxisAlignment: MainAxisAlignment.start,
  //   //                 crossAxisAlignment: CrossAxisAlignment.start,
  //   //                 children: [
  //   //                   // Text(product.getShortTitle()),
  //   //                   SizedBox(
  //   //                     height: 5.0,
  //   //                   ),
  //   //                   Text(
  //   //                     'product.title',
  //   //                     style: TextStyle(fontSize: 10.0),
  //   //                   ),
  //   //                 ],
  //   //               )),
  //   //           SizedBox(width: 10),
  //   //           Flexible(
  //   //             child: Column(
  //   //               mainAxisAlignment: MainAxisAlignment.start,
  //   //               crossAxisAlignment: CrossAxisAlignment.end,
  //   //               children: [
  //   //                 Expanded(
  //   //                   child: Container(
  //   //                     child: Text(
  //   //                       '\$' + product.price.toString(),
  //   //                       style: TextStyle(fontWeight: FontWeight.bold),
  //   //                     ),
  //   //                   ),
  //   //                 ),
  //   //                 Expanded(
  //   //                   child: Row(
  //   //                     mainAxisAlignment: MainAxisAlignment.end,
  //   //                     children: [
  //   //                       Text(
  //   //                         'Qty',
  //   //                         style: TextStyle(fontSize: 13.0),
  //   //                       ),
  //   //                       SizedBox(
  //   //                         width: 10.0,
  //   //                       ),
  //   //                       DropdownButton(
  //   //                         underline: SizedBox(),
  //   //                         value: shoppingCart.getCartMap()[product],
  //   //                         items: List.generate(11, (index) {
  //   //                           return DropdownMenuItem(
  //   //                             alignment: AlignmentDirectional.center,
  //   //                             child: Container(
  //   //                               margin: EdgeInsets.zero,
  //   //                               child: Text(
  //   //                                 index.toString(),
  //   //                                 style: TextStyle(fontSize: 15.0),
  //   //                               ),
  //   //                             ),
  //   //                             value: index,
  //   //                           );
  //   //                         }).getRange(1, 11).toList(),
  //   //                         onChanged: (value) {
  //   //                           setState(() {
  //   //                             if (value != null) {
  //   //                               shoppingCart.updateQty(
  //   //                                 product: product,
  //   //                                 qty: value as int,
  //   //                               );
  //   //                             }
  //   //                           });
  //   //                         },
  //   //                       ),
  //   //                     ],
  //   //                   ),
  //   //                 ),
  //   //                 SizedBox(
  //   //                   height: 10,
  //   //                 ),
  //   //                 Expanded(
  //   //                   child: RemoveButton(
  //   //                     shoppingCart: shoppingCart,
  //   //                     product: product,
  //   //                     onTapCallback: (callback) {
  //   //                       setState(() {
  //   //                         callback;
  //   //                       });
  //   //                     },
  //   //                   ),
  //   //                 ),
  //   //               ],
  //   //             ),
  //   //           ),
  //   //         ],
  //   //       ),
  //   //     );
  //   //   },
  //   // );
  // }
}

class CartListViewItemCard extends StatelessWidget {
  final ShoppingCartItem cartItem;
  CartListViewItemCard({ required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      decoration: kButtonDecoration,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(product.getShortTitle()),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    cartItem.title!,
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
                      '\$' + cartItem.price.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Qty',
                        style: TextStyle(fontSize: 13.0),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      // DropdownButton(
                      //   underline: SizedBox(),
                      //   value: shoppingCart.getCartMap()[product],
                      //   items: List.generate(11, (index) {
                      //     return DropdownMenuItem(
                      //       alignment: AlignmentDirectional.center,
                      //       child: Container(
                      //         margin: EdgeInsets.zero,
                      //         child: Text(
                      //           index.toString(),
                      //           style: TextStyle(fontSize: 15.0),
                      //         ),
                      //       ),
                      //       value: index,
                      //     );
                      //   }).getRange(1, 11).toList(),
                      //   onChanged: (value) {
                      //     setState(() {
                      //       if (value != null) {
                      //         shoppingCart.updateQty(
                      //           product: product,
                      //           qty: value as int,
                      //         );
                      //       }
                      //     });
                      //   },
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Placeholder(),
                  // child: RemoveButton(
                  //   shoppingCart: shoppingCart,
                  //   product: product,
                  //   onTapCallback: (callback) {
                  //     setState(() {
                  //       callback;
                  //     });
                  //   },
                  // ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
