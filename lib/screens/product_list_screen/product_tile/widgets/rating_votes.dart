import 'package:ecommerce_demo/screens/order_success/constants.dart';
import 'package:flutter/material.dart';

class RatingVotes extends StatelessWidget {
  const RatingVotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '(126)',
      style: kSmallFontTextStyle.copyWith(fontSize: 10),
      maxLines: 1,
    );
  }
}
