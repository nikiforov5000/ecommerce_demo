import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductTile extends StatelessWidget {
  ProductTile({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              // color: Colors.red,
              child: Image(
                image: NetworkImage(
                  product.imgUrl,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                // color: Colors.blue,
                child: Text(
                  product.title.split(' ')[0] + product.title.split(' ')[1],
                  textAlign: TextAlign.center,
                  // style: TextStyle(backgroundColor: Colors.green),
                ),
              ),
            ),
          ),
          Container(
            child: Text('\$${product.price}', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700),),
          ),
        ],
      ),
    );
  }
}
