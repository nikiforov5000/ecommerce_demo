import 'package:flutter/material.dart';

import '../constants/text_styles.dart';
import '../models/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
           // Image(image: NetworkImage(product.imgUrl)),
            ProductImageCarousel(product: product,),
            Text(
              '-  1  +',
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            Container(
              height: 60.0,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Buy Now',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
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

class ProductImageCarousel extends StatelessWidget {

  final Product product;

  const ProductImageCarousel({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return             CarouselSlider(
      options: CarouselOptions(height: 400.0),
      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                // decoration: BoxDecoration(
                //     color: Colors.amber
                // ),
                // child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                child: Image(image: NetworkImage(product.imgUrl)),
            );
          },
        );
      }).toList(),
    );
  }
}

