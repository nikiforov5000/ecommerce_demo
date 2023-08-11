import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/constants/decorations.dart';
import 'package:ecommerce_demo/constants/shadows.dart';
import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/screens/order_success/constants.dart';
import 'package:ecommerce_demo/screens/product_list_screen/widgets/product_tile_image.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.product,
    required this.onTapCallback,
  }) : super(key: key);

  final Product product;
  final VoidCallback onTapCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kButtonDecoration,
      
      child: Column(
        /// TODO add border radius to product image

        children: [
          Flexible(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                color: Colors.grey.shade200,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductTileImage(imageUrl: product.imgUrl),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ProductTitle(title: product.title),
                  ProductRating(rating: product.rate),
                  const SizedBox(
                    height: 3,
                  ),
                  ProductPrice(price: product.price),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    // return InkWell(
    //   onTap: onTapCallback,
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //     decoration: kButtonDecoration,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Flexible(
    //           flex: 4,
    //           child: ProductTileImage(product: product),
    //         ),
    //         Flexible(
    //           child: Text(
    //             product.getShortTitle(),
    //             textAlign: TextAlign.center,
    //             style: kProductTileTitleTextStyle,
    //           ),
    //         ),
    //         Flexible(
    //           child: Text(
    //             '\$${product.price}',
    //             textAlign: TextAlign.center,
    //             style: kProductTilePriceTextStyle,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

class ProductPrice extends StatelessWidget {
  ProductPrice({required this.price, Key? key}) : super(key: key);

  final double price;
  int? thousands;
  int? whole;
  int? cents;

  String? thousandsStr;
  String? wholeStr;
  String? centsStr;

  String currency = 'TL';

  void fillMoneyVariables() {
    thousands = (price / 1000).floor();
    whole = (price % 1000).floor();
    cents = (price % 1 * 100).floor();

    if (thousands! > 0) {
      thousandsStr = '$thousands.';
    } else {
      thousandsStr = '';
    }

    wholeStr = whole.toString();
    if (thousands! > 0 && whole! < 100) {
      wholeStr = '0${wholeStr!}';
    }
    centsStr = cents.toString();
    if (cents! < 10) {
      centsStr = '0${centsStr!}';
    }
  }

  @override
  Widget build(BuildContext context) {
    fillMoneyVariables();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(thousandsStr!, style: kPriceTextStyle),
        Text(wholeStr!, style: kPriceTextStyle),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              centsStr!,
              style: kPriceTextStyle.copyWith(fontSize: 12),
            ),
            const SizedBox(
              height: 6,
            ),
          ],
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          currency,
          style: kPriceTextStyle.copyWith(fontSize: 15),
        ),
      ],
    );
  }
}

const kPriceTextStyle = TextStyle(fontSize: 20, color: kDarkTextColor);

class ProductRating extends StatelessWidget {
  const ProductRating({required this.rating, Key? key}) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: RatingNumber(rating)),
        const SizedBox(
          width: 5,
        ),
        RatingStars(rating),
        const SizedBox(
          width: 5,
        ),
        const Flexible(child: RatingVotes()),
      ],
    );
  }
}

class RatingVotes extends StatelessWidget {
  const RatingVotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '(126)',
      style: kSmallFontTextStyle.copyWith(fontSize: 10),
    );
  }
}

// final k

class RatingStars extends StatelessWidget {
  RatingStars(this.rating, {Key? key}) : super(key: key);

  final double rating;

  List<Widget> stars = [];

  void fillStars() {
    for (int i = 0; i < rating.floor(); ++i) {
      stars.add(const StylizedStar(Icons.star));
    }
    if (rating % 1 > 0) {
      stars.add(const StylizedStar(Icons.star_half));
    }
  }

  @override
  Widget build(BuildContext context) {
    fillStars();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stars,
    );
  }
}

class StylizedStar extends StatelessWidget {
  const StylizedStar(this.star, {Key? key}) : super(key: key);

  final IconData star;

  final double size = 16;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 13,
      child: Stack(
        children: [
          Icon(
            star,
            color: Colors.orangeAccent,
            size: size,
          ),
          Icon(
            Icons.star_border_outlined,
            color: Colors.orange,
            size: size,
          ),
        ],
      ),
    );
  }
}

class RatingNumber extends StatelessWidget {
  const RatingNumber(this.rating, {Key? key}) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Text(
      rating.toString(),
      style: kBlueRatingNumberTextStyle,
    );
  }
}

const kBlueRatingNumberTextStyle = TextStyle(color: Colors.blue, fontSize: 12);

class ProductTitle extends StatelessWidget {
  const ProductTitle({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: kProductTileTitleTextStyle.copyWith(color: kDarkTextColor),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
