import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/screens/product_list_screen/product_tile/widgets/product_price.dart';
import 'package:ecommerce_demo/screens/product_list_screen/product_tile/widgets/product_rating.dart';
import 'package:ecommerce_demo/screens/product_list_screen/product_tile/widgets/product_title.dart';
import 'package:flutter/material.dart';


class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: FittedBox(
        child: Container(
          color: Colors.grey.shade200,
          width: MediaQuery.of(context).size.width / 3,
          child: Column(
            children: [
              ProductTitle(title: product.title),
              ProductRating(rating: product.rate),
              const SizedBox(height: 3),
              ProductPrice(price: product.price),
            ],
          ),
        ),
      ),
    );
  }
}

