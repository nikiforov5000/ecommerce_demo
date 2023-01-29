import 'package:flutter/material.dart';

double blurRadius = 10;
double offset = 10;

List<BoxShadow> kTreeDShadows = [
  BoxShadow(
      color: Color(0xff0d1126).withOpacity(.1),
      offset: Offset(offset, offset),
      blurRadius: blurRadius
  ),
  BoxShadow(
      color: Colors.white,
      offset: Offset(-1 * offset, -1 * offset),
      blurRadius: blurRadius
  ),
];