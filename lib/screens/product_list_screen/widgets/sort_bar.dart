import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/constants/shadows.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:flutter/material.dart';

enum SortBy {
  none,
  priceLo,
  priceHi,
  rateLo,
  rateHi,
}

class SortBar extends StatefulWidget {
  final Function onChangesCallback;
  const SortBar({
    Key? key,
    required this.onChangesCallback,
  }) : super(key: key);

  @override
  State<SortBar> createState() => _SortBarState();
}

class _SortBarState extends State<SortBar> {
  SortBy _sortBy = SortBy.none;
  @override
  Widget build(BuildContext context) {
    ProductData.sortProducts(_sortBy);
    final height = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
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
            value: _sortBy,
            underline: const SizedBox(),
            items: [
              for (var sortBy in SortBy.values)
                DropdownMenuItem(
                  value: sortBy,
                  child: getDropdownIcon(sortBy),
                ),
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

Widget getDropdownIcon(SortBy sortBy) {
  double iconSize = 18.0;

  switch (sortBy) {
    case SortBy.priceHi:
      return Row(
        children: [
          Icon(Icons.attach_money, size: iconSize),
          Icon(Icons.arrow_downward, size: iconSize),
        ],
      );
    case SortBy.priceLo:
      return Row(
        children: [
          Icon(Icons.attach_money, size: iconSize),
          Icon(Icons.arrow_upward, size: iconSize),
        ],
      );
    case SortBy.rateHi:
      return Row(
        children: [
          Icon(Icons.star_rate, size: iconSize),
          Icon(Icons.arrow_downward, size: iconSize),
        ],
      );
    case SortBy.rateLo:
      return Row(
        children: [
          Icon(Icons.star_rate, size: iconSize),
          Icon(Icons.arrow_upward, size: iconSize),
        ],
      );
    default:
      return const Text('');
  }
}
