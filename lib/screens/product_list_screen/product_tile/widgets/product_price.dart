import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:ecommerce_demo/constants/units.dart';
import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  ProductPrice({required this.price, Key? key}) : super(key: key);

  final double price;
  int? thousands;
  int? whole;
  int? cents;

  String? thousandsStr;
  String? wholeStr;
  String? centsStr;



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
        Text(
          currency,
          style: kPriceTextStyle.copyWith(fontSize: 15),
        ),
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
      ],
    );
  }
}
