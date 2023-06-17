import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class LogoHomeButton extends StatelessWidget {
  const LogoHomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.popUntil(context, ModalRoute.withName(Wrapper.id));
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  kBackgroundColor.withOpacity(.5),
                  kDarkBlueLogoColor.withOpacity(0),
                ],
                stops: [
                  0.0,
                  1,
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: SimpleShadow(
              opacity: 1,
              color: Colors.white,
              offset: Offset(0,0),
              sigma: 1,
              child: Image.asset('assets/logo/dixi-logo.png'),
            ),
          ),

        ],
      ),
    );
  }
}
