
import 'package:flutter/material.dart';

class PrivacyPolicyText extends StatelessWidget {
  const PrivacyPolicyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'By clicking submit order, you agree to eCommerce Demo'
          ' Terms of Use and Privacy Policy',
      style: TextStyle(
        fontSize: 14,
        color: Colors.black54,
        height: 1.5,
      ),
    );
  }
}


