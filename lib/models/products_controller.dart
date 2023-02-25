import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ProductsController {
  final _auth = FirebaseAuth.instance;
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;



  static getAllProducts() async {
    await for (var snapshot in _firestore.collection('products').snapshots()) {
      for (var product in snapshot.docs) {
        // print(product.data());
      }
    }
  }

  // static Widget getStreamBuilder() {
  //   return
  // }
}
// return GridView.count(crossAxisCount: 2, children: [
//   for (var product in currentProducts)
//     Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
//       child: ProductTile(
//         product: product,
//         onTapCallback: () {
//           Navigator.pushNamed(context, ProductScreen.id,
//               arguments: product);
//         },
//       ),
//     ),
// ]);
