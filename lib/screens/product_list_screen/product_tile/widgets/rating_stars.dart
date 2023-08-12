import 'package:ecommerce_demo/screens/product_list_screen/product_tile/widgets/stylized_star.dart';
import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  RatingStars(this.rating, {Key? key}) : super(key: key);

  final double rating;
  final List<Widget> stars = [];

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
