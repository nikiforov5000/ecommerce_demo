import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/text_styles.dart';
import '../models/product.dart';
import '../models/shopping_cart.dart';
import '../widgets/buttonText.dart';
import '../widgets/color_filtered_image.dart';
import '../widgets/user_avatar.dart';

class ProductScreen extends StatelessWidget {
  static const String id = 'product_screen';
  ProductScreen({required this.product}) {}

  Product? product;
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser!;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(product!.title),
        actions: [
          UserAvatarWidget(user: loggedInUser),
        ],
      ),
      body: Container(
        color: kBackgroundColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * .03,
            ),
            ProductImageCarousel(
              product: product!,
            ),
            SizedBox(
              height: screenHeight * .03,
            ),
            ButtonsBlock(product: product!),
            SizedBox(
              height: screenHeight * .03,
            ),
            Expanded(child: AboutProduct(product: product!)),
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
      // options: CarouselOptions(height: 200.0),
      options: CarouselOptions(viewportFraction: 1, enlargeCenterPage: true),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              child: ColorFilteredImage(product: product),
              onTap: () {
                Navigator.push<Widget>(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ImageScreen(product: product, index: i),
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
                child: Container(),
                flex: 2,
              ),
              Expanded(
                child: RoundedButton(
                  labelWidget: Icon(
                    Icons.remove,
                    color: kDarkTextColor,
                    size: 15,
                  ),
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
                  horizontal: 15,
                ),
                child: Text(
                  quantity.toString(),
                  style: kProductScreenQuantityTextStyle,
                ),
              ),
              Expanded(
                child: RoundedButton(
                  labelWidget: Icon(
                    Icons.add,
                    color: kDarkTextColor,
                    size: 15,
                  ),
                  onTapCallback: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(),
                flex: 2,
              ),
            ],
          ),
          RoundedButton(
              labelWidget: ButtonText(text: 'Add to Cart'),
              onTapCallback: () {
                shoppingCart.addProduct(widget.product, quantity);
              }),
          RoundedButton(
              labelWidget: ButtonText(text: 'Go to Cart'),
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
        SizedBox(
          height: 10.0,
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
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Text(
              product.description,
              style: kProductDescriptionTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}

class ImageScreen extends StatelessWidget {
  const ImageScreen({required this.product, required this.index});

  final int index;
  final Product product;

  @override
  Widget build(BuildContext context) {
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
    ;
  }
}
