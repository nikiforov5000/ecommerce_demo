import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:flutter/material.dart';

class LargeImageScreen extends StatelessWidget {
  const LargeImageScreen({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final int index;
  final Product product;

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: CarouselSlider(
        options: CarouselOptions(
          initialPage: index,
          enlargeCenterPage: true,
          height: MediaQuery.of(context).size.height,
        ),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Image.network(
                product.imgUrl,
                fit: BoxFit.fitWidth,
                width: double.infinity,
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
