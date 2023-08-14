import 'package:ecommerce_demo/screens/product_list_screen/product_tile/widgets/rating_number.dart';
import 'package:ecommerce_demo/screens/product_list_screen/product_tile/widgets/rating_stars.dart';
import 'package:ecommerce_demo/screens/product_list_screen/product_tile/widgets/rating_votes.dart';
import 'package:flutter/material.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({required this.rating, Key? key}) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: RatingNumber(rating),
        ),
        const SizedBox(
          width: 5,
        ),
        RatingStars(rating),
        const SizedBox(
          width: 5,
        ),
        const Flexible(
          child: RatingVotes(),
        ),
      ],
    );
  }
}
