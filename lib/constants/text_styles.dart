import 'package:flutter/material.dart';

const kProductScreenTitleTextStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 20.0,
);

const kProductScreenRatingTextStyle = TextStyle(
    fontSize: 20.0,);

const kButtonTextStyle = TextStyle(
  fontFamily: 'Arsenal',
  fontSize: 17.0,
  color: Colors.black87,
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
