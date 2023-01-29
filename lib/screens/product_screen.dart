import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';

import '../constants/text_styles.dart';
import '../models/product.dart';
import '../models/shopping_cart.dart';
import '../widgets/sized_box_vertical_separator.dart';

class ProductScreen extends StatelessWidget {
  static const String id = '/productScreen';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * .03,
            ),
            ProductImageCarousel(
              product: product,
            ),
            SizedBox(
              height: screenHeight * .03,
            ),
            ButtonsBlock(product: product),
            SizedBox(
              height: screenHeight * .03,
            ),
            Expanded(child: AboutProduct(product: product)),
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
      options: CarouselOptions(height: 200.0),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Image(image: NetworkImage(product.imgUrl)),
            );
          },
        );
      }).toList(),
    );
  }
}

class ButtonsBlock extends StatefulWidget {
  const ButtonsBlock({required this.product});

  final Product product;

  @override
  State<ButtonsBlock> createState() => _ButtonsBlockState();
}

class _ButtonsBlockState extends State<ButtonsBlock> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: RoundedButton(
                  color: Colors.blue,
                  label: '-',
                  onTapCallback: () {
                    setState(() {
                      if (quantity > 1) {
                        quantity--;
                      }
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  quantity.toString(),
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Expanded(
                child: RoundedButton(
                  color: Colors.blue,
                  label: '+', //002b
                  onTapCallback: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          RoundedButton(
              label: 'Add to Cart',
              color: Colors.blue,
              onTapCallback: () {
                shoppingCart.addProduct(widget.product, quantity);
              }),
          SizedBox(
            height: 15,
          ),
          RoundedButton(
              label: 'Go to Cart',
              color: Colors.blue,
              onTapCallback: () {
                Navigator.pushNamed(context, ShoppingCartScreen.id);
              }),
        ]);
  }
}

class AboutProduct extends StatelessWidget {
  const AboutProduct({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          product.title,
          style: kProductScreenTitleTextStyle,
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Rating: ',
              style: kProductScreenRatingTextStyle,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
              child: Text(product.discription),
          ),
        ),
      ],
    );
  }
}
