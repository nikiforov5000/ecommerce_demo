import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/text_on_bankcard.dart';

class CheckoutScreen extends StatelessWidget {
  static const String id = 'checkout_screen';

  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Container(
        color: kBackgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BankCard(),
                    SizedBox(
                      height: 20,
                    ),
                    SectionNameText(text: 'Choose payment method'),
                    SizedBox(
                      height: 20,
                    ),
                    PaymentMethods(),
                    SizedBox(
                      height: 20,
                    ),
                    SectionNameText(text: 'Promo Code'),
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            onChanged: (value) {},
                          ),
                        ),
                        RoundedButton(
                            labelWidget: Text('Apply'), onTapCallback: () {})
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SectionNameText(
                          text: 'Total Payment',
                        ),
                        Text(
                          '\$344',
                          style:
                              TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 50,),
                    RoundedButton(
                        labelWidget: Text(
                          'Pay',
                          style: kButtonTextStyle,
                        ),
                        onTapCallback: () {}),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int _selectedIcon = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PaymentMethodIcon(Icons.payment),
        PaymentMethodIcon(Icons.paypal),
        PaymentMethodIcon(Icons.currency_lira),
        PaymentMethodIcon(Icons.currency_bitcoin),
        PaymentMethodIcon(Icons.money),
      ],
    );
  }
}

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

class PaymentMethodIcon extends StatelessWidget {
  const PaymentMethodIcon(this.icon);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 35,
    );
  }
}
