import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/screens/product_screen/widgets/breadcrumbs.dart';
import 'package:ecommerce_demo/screens/product_screen/widgets/buttons_block.dart';
import 'package:ecommerce_demo/screens/product_screen/widgets/price.dart';
import 'package:ecommerce_demo/screens/product_screen/widgets/product_description.dart';
import 'package:ecommerce_demo/screens/product_screen/widgets/product_image_carousel.dart';
import 'package:ecommerce_demo/screens/product_screen/widgets/product_rating.dart';
import 'package:ecommerce_demo/screens/product_screen/widgets/product_short_title.dart';
import 'package:ecommerce_demo/widgets/cart_icon/stream_builder.dart';
import 'package:ecommerce_demo/widgets/icon_template.dart';
import 'package:ecommerce_demo/widgets/logo_home_button.dart';
import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  static const String id = 'product_screen';
  final Product _product;

  const ProductScreen({
    Key? key,
    required Product product,
  })  : _product = product,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const LogoHomeButton(),
        actions: [
          AppBarIconTemplate(child: const CartIconStreamBuilder()),
          AppBarIconTemplate(child: UserAvatarWidget()),
          AppBarIconTemplate(child: LogoutButton()),
        ],
      ),
      body: Container(
        color: kBackgroundColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * .015),
              Breadcrumbs(_product),
              SizedBox(height: screenHeight * .03),
              ProductImageCarousel(_product),
              SizedBox(height: screenHeight * .03),
              Price(_product),
              ButtonsBlock(_product),
              SizedBox(height: screenHeight * .03),
              ProductShortTitle(_product),
              ProductRating(_product),
              ProductDescription(_product),
            ],
          ),
        ),
      ),
    );
  }
}
