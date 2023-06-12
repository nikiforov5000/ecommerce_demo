import 'package:flutter/material.dart';

import 'package:ecommerce_demo/constants/colors.dart';

const kProductScreenTitleTextStyle = TextStyle(
  // fontFamily: 'Arsenal',
  fontSize: 23.0,
  color: kDarkTextColor,
);

const kProductDescriptionTextStyle = TextStyle(
  // fontFamily: 'Arsenal',
  fontSize: 17.0,
  color: kDarkTextColor,
);

const kProductScreenRatingTextStyle = TextStyle(
  // fontFamily: 'Arsenal',
  fontSize: 17.0,
  color: kDarkTextColor,
);

const kButtonTextStyle = TextStyle(
  // fontFamily: 'Arsenal',
  fontSize: 15.0,
  color: kDarkTextColor,
);

TextStyle kProductTileTitleTextStyle = TextStyle(
  color: Colors.grey.shade600,
  fontSize: 13.0,
);

const kAppbarTextStyle = TextStyle(
  // fontFamily: 'Arsenal',
  fontSize: 20.0,
  color: kDarkTextColor,
);

const kProductScreenQuantityTextStyle = TextStyle(
  // fontFamily: 'Arsenal',
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
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

const kSortTextStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 13);

TextStyle kBreadcrumbsTextStyle = kButtonTextStyle.copyWith(
  color: Colors.blue.shade600,
  decoration: TextDecoration.underline,
);