import 'package:ecommerce_demo/screens/order_summary/widgets/order_summary_price.dart';
import 'package:ecommerce_demo/screens/order_summary/widgets/payment_details_card.dart';
import 'package:ecommerce_demo/screens/order_summary/widgets/privacy_policy_text.dart';
import 'package:ecommerce_demo/screens/order_summary/widgets/screen_header.dart';
import 'package:ecommerce_demo/screens/order_summary/widgets/shipping_address_details_card.dart';
import 'package:ecommerce_demo/widgets/icon_template.dart';
import 'package:ecommerce_demo/widgets/logo_home_button.dart';
import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  static const String id = 'order_summary';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoHomeButton(),
        actions: [
          AppBarIconTemplate(child: UserAvatarWidget()),
          AppBarIconTemplate(child: LogoutButton()),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 10.0, bottom: 20.0),
          child: Column(
            children: [
              Flexible(
                child: ListView(children: const [
                  ScreenHeader(),
                  SizedBox(height: 10),
                  PrivacyPolicyText(),
                  SizedBox(height: 20),
                  PaymentDetailsCard(),
                  ShippingAddressDetailsCard(),
                ]),
              ),
              const OrderSummaryPrice(),
            ],
          ),
        ),
      ),
    );
  }
}
