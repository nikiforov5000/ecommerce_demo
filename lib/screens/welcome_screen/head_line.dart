import 'package:ecommerce_demo/screens/welcome_screen/head_line_text.dart';
import 'package:flutter/material.dart';

class HeadLine extends StatelessWidget {
  const HeadLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      headLineText,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.grey,),
    );
  }
}


