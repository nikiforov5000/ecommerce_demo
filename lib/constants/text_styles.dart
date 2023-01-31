import 'package:flutter/material.dart';

import 'colors.dart';

const kProductScreenTitleTextStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 20.0,
);

const kProductScreenRatingTextStyle = TextStyle(
  fontSize: 20.0,
);

const kButtonTextStyle = TextStyle(
  fontFamily: 'Arsenal',
  fontSize: 17.0,
  color: kDarkTextColor,
);

TextStyle kProductTileTitleTextStyle = TextStyle(
  color: Colors.grey.shade600,
  fontSize: 13.0,
);

const kAppbarTextStyle = TextStyle(
  fontFamily: 'Arsenal',
  fontSize: 20.0,
  color: kDarkTextColor,
);

const kProductTilePriceTextStyle = TextStyle(fontWeight: FontWeight.w700,
fontSize: 15,
    color: kDarkTextColor,
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
