import 'package:flutter/material.dart';

import '../constants/text_styles.dart';
import '../models/product.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
        child: Column(
          children: [
            Image(image: NetworkImage(product.imgUrl)),
            SizedBox(height: 30.0,),
            Text(product.title, style: kProductScreenTitleTextStyle, textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
