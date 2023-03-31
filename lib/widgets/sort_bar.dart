import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/constants/shadows.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:flutter/material.dart';

enum SortBy { priceLo, priceHi, rateLo, rateHi, none }

class SortBar extends StatefulWidget {
  final Function onChangesCallback;
  SortBar({required this.onChangesCallback});
  @override
  State<SortBar> createState() => _SortBarState();
}

class _SortBarState extends State<SortBar> {
  @override
  SortBy _sortBy = SortBy.none;
  Widget build(BuildContext context) {

    ProductData.sortProducts(_sortBy);

    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14.0),
      decoration: BoxDecoration(
        boxShadow: k3DShadows,
        color: kTileColor,
        borderRadius: BorderRadius.circular(10),
      ),
      height: height * 0.06,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: Icon(
              Icons.sort,
              color: kDarkTextColor,
              size: 25.0,
            ),

          ),
          DropdownButton(
            items: [
              for (var s in SortBy.values)
                DropdownMenuItem(value: s, child: Text(s.name.capitalize())),
            ],
            onChanged: (SortBy? value) {
              widget.onChangesCallback(value);
              if (value != null && value != SortBy.none) {
                _sortBy = value;
              }
            },
          ),
        ],
      ),
    );
  }
}
