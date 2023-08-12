import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/product_list_screen/product_tile/product_tile.dart';
import 'package:ecommerce_demo/screens/product_screen/product_screen.dart';
import 'package:flutter/material.dart';

class SeeAlso extends StatelessWidget {
  final String _category;

  const SeeAlso(this._category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        const Row(
          children: [
            Text(
              'See also',
              style: kProductScreenTitleTextStyle,
            ),
          ],
        ),
        SizedBox(height: screenHeight * .03),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          children: ProductData.products.map(
            (product) {
              return ProductTile(
                product: product,
                onTapCallback: () {
                  Navigator.pushNamed(
                    context,
                    ProductScreen.id,
                    arguments: product,
                  );
                },
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}