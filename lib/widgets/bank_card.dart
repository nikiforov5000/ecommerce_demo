import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:ecommerce_demo/widgets/text_on_bankcard.dart';
import 'package:flutter/material.dart';
class BankCard extends StatelessWidget {
  const BankCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(3, 3), blurRadius: 10)
          ]),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BANK NAME',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextOnBankCard(text: '4541 3252 2524 9643'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextOnBankCard(text: 'Boris Nikiforov'),
                      TextOnBankCard(text: '11/25'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionNameText extends StatelessWidget {
  const SectionNameText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: kButtonTextStyle,
    );
  }
}
