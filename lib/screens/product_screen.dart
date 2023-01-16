import 'package:flutter/material.dart';

import '../constants/text_styles.dart';
import '../models/product.dart';
import '../widgets/sized_box_vertical_separator.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  static const String id = '/productScreen';

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50.0,
        ),
        child: ListView(
          children: [
            kProductScreenTopBottomBlancSizedBox,
            Image(image: NetworkImage(product.imgUrl)),
            SizedBox(
              height: 30.0,
            ),
            Text(
              product.title,
              style: kProductScreenTitleTextStyle,
              textAlign: TextAlign.center,
            ),
            kProductScreenColumnSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rating: ',
                  style: kProductScreenRatingTextStyle,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: getRatingColor(product.rate),
                  ),
                  child: Text(
                    product.rate.toString(),
                    style: kProductScreenRatingTextStyle,
                  ),
                ),
              ],
            ),
            kProductScreenColumnSizedBox,
            Text(product.discription),
            kProductScreenTopBottomBlancSizedBox,
          ],
        ),
      ),
    );
  }
}
