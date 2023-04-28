import 'package:ecommerce_demo/widgets/bank_card.dart';
import 'package:ecommerce_demo/widgets/icon_template.dart';
import 'package:ecommerce_demo/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';

class CheckoutScreen extends StatelessWidget {
  static const String id = 'checkout_screen';

  CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        actions: [
          AppBarIconTemplate(child: UserAvatarWidget()),
        ],
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
                BankCard(),
                SizedBox(height: 20),
                SectionNameText(text: 'Choose payment method'),
                SizedBox(height: 20),
                PaymentMethods(),
                SizedBox(height: 20),
                PromoCodeSection(),
                SizedBox(height: 80),
                PayButtonSection(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PayButtonSection extends StatelessWidget {
  const PayButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SectionNameText(
              text: 'Total Payment',
            ),
            Text(
              '\$344',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        RoundedButton(
            labelWidget: Text(
              'Pay',
              style: kButtonTextStyle,
            ),
            onTapCallback: () {}),
      ],
    );
  }
}

class PromoCodeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionNameText(text: 'Promo Code'),
        Row(
          children: [
            Flexible(
              child: TextField(
                onChanged: (value) {},
              ),
            ),
            RoundedButton(labelWidget: Text('Apply'), onTapCallback: () {})
          ],
        )
      ],
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
