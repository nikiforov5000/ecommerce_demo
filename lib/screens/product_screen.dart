import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen.dart';
import 'package:flutter/material.dart';

import '../constants/text_styles.dart';
import '../models/product.dart';
import '../models/shopping_cart.dart';
import '../widgets/sized_box_vertical_separator.dart';

int quantity = 0;

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  static const String id = '/productScreen';

  @override
  Widget build(BuildContext context) {
    print('productScreen().build');
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        leading: ArrowBackWidget(),
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
            PlusMinusButtons(),
            SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () {
                shoppingCart.addProduct(product, quantity);
              },
              child: Container(
                height: 60.0,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, ShoppingCartScreen.id);
              },
              child: Container(
                height: 60.0,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Go to Cart',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
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

class ArrowBackWidget extends StatefulWidget {
  const ArrowBackWidget({Key? key}) : super(key: key);

  @override
  State<ArrowBackWidget> createState() => _ArrowBackWidgetState();
}

class _ArrowBackWidgetState extends State<ArrowBackWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          print('back');
          quantity = 0;
          Navigator.pop;
        });
      },
      child: Container(
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}

class PlusMinusButtons extends StatefulWidget {
  @override
  State<PlusMinusButtons> createState() => _PlusMinusButtonsState();
}

class _PlusMinusButtonsState extends State<PlusMinusButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          child: Icon(
            const IconData(0x2212),
            size: 35,
          ),
          onPressed: () {
            setState(() {
              quantity--;
            });
          },
        ),
        SizedBox(
          width: 30,
        ),
        Text(
          quantity.toString(),
          style: TextStyle(fontSize: 40),
        ),
        SizedBox(
          width: 30,
        ),
        FloatingActionButton(
          child: Icon(
            const IconData(0x002B),
            size: 35,
          ),
          onPressed: () {
            setState(() {
              quantity++;
            });
          },
        ),
      ],
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
