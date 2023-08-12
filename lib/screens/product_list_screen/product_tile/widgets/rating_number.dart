import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:flutter/material.dart';

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
