import 'package:flutter/material.dart';

class LogoHero extends StatelessWidget {
  @override
  Widget build(BuildContext _) {
    return Flexible(
      child: Hero(
        tag: 'logo',
        child: Container(
          height: 200.0,
          child: const Center(
              child: Text(
            'eCommerce Demo app',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.w100, color: Colors.blue)
          )),
        ),
      ),
    );
  }
}
