import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle( {Key? key, required this.title,}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: kProductTileTitleTextStyle.copyWith(color: kDarkTextColor),
      maxLines: 2,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    );
  }
}
