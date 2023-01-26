import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';

import '../constants/text_styles.dart';
import '../models/product.dart';
import '../models/shopping_cart.dart';
import '../widgets/sized_box_vertical_separator.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  static const String id = '/productScreen';

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    print('productScreen().build');
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
            // Image(image: NetworkImage(product.imgUrl)),
            ProductImageCarousel(
              product: product,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: RoundedButton(
                    color: Colors.blue,
                    text: '-', //2212
                    onPress: () {
                      setState(() {
                        if (quantity > 1) {
                          quantity--;
                        }
                      });
                    },
                  ),
                ),
                // SizedBox(
                //   width: 30,
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    quantity.toString(),
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                // SizedBox(
                //   width: 30,
                // ),
                Expanded(
                  child: RoundedButton(
                    color: Colors.blue,
                    text: '+', //002b
                    onPress: () {
                      setState(() {
                        quantity++;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            const SizedBox(
              height: 30.0,
            ),
            RoundedButton(
                text: 'Add to Cart',
                color: Colors.blue,
                onPress: () {
                  shoppingCart.addProduct(product, quantity);
                }),
            RoundedButton(
                text: 'Go to Cart',
                color: Colors.blue,
                onPress: () {
                  Navigator.pushNamed(context, ShoppingCartScreen.id);
                }),
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
                const Text(
                  'Rating: ',
                  style: kProductScreenRatingTextStyle,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
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
    return CarouselSlider(
      options: CarouselOptions(height: 400.0),
      items: [1, 2, 3, 4, 5].map((i) {
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
