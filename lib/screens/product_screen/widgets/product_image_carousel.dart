import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/screens/product_screen/widgets/large_image_screen.dart';
import 'package:ecommerce_demo/widgets/color_filtered_image.dart';
import 'package:flutter/material.dart';

class ProductImageCarousel extends StatelessWidget {
  final Product _product;

  const ProductImageCarousel(this._product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(viewportFraction: 1, enlargeCenterPage: true),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              child: ColorFilteredImage(imgUrl: _product.imgUrl),
              onTap: () {
                Navigator.push<Widget>(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LargeImageScreen(product: _product, index: i),
                  ),
                );
              },
            );
          },
        );
      }).toList(),
    );
  }
}
