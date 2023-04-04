import 'package:ecommerce_demo/screens/order_success/widgets/big_text.dart';
import 'package:ecommerce_demo/screens/order_success/widgets/small_text.dart';
import 'package:flutter/material.dart';

class BigAndSmallTextColumn extends StatelessWidget {
  final String bigText;
  final String smallText;

  BigAndSmallTextColumn(this.bigText, this.smallText);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BigText(bigText),
        SizedBox(
          height: 5,
        ),
        SmallText(smallText),
      ],
    );
  }
}
