import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/wrapper.dart';
import 'package:flutter/material.dart';

class LogoHomeButton extends StatelessWidget {
  const LogoHomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.popUntil(context, ModalRoute.withName(Wrapper.id));
      },
      child: SizedBox(
        height: height / 20,
        child: ColorFiltered(
          colorFilter: const ColorFilter.mode(kTileColor, BlendMode.darken),
          child: Image.asset('assets/logo/dixi-logo.png'),
        ),
      ),
    );
  }
}
