import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/constants/shadows.dart';
import 'package:flutter/material.dart';

class AppBarIconTemplate extends StatelessWidget {
  Widget _child;

  BoxDecoration _decoration = BoxDecoration(
    color: kAppBarIconBackgroundColor,
    gradient: LinearGradient(colors: [Colors.blue.withOpacity(.05), Colors.black.withOpacity(.1)]),
    shape: BoxShape.circle,
    boxShadow: k3DShadows,
  );
  AppBarIconTemplate({Key? key, required Widget child}) :  _child = child,super(key: key);
  final double size = 40.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 7.0),
      width: size,
      height: size,
      decoration: _decoration,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          _child,
        ],
      ),
    );
  }
}