import 'package:flutter/material.dart';

const kProductScreenTitleTextStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 20.0,
);

const kProductScreenRatingTextStyle = TextStyle(
    fontSize: 20.0,);

const kButtonTextStyle = TextStyle(
  fontFamily: 'Arsenal',
  // fontWeight: FontWeight.bold,
  fontSize: 20.0,
  letterSpacing: -0.7,
  color: Colors.white,
);


getRatingColor(double rating) {
  if (rating > 4.0) {
    return Colors.green;
  }
  if (rating > 3.0) {
    return Colors.yellow;
  }
  if (rating > 2.0) {
    return Colors.orange;
  }
  if (rating > 1.0) {
    return Colors.red;
  }
  return Colors.transparent;
}
