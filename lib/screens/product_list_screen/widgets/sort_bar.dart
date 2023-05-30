import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/constants/shadows.dart';
import 'package:ecommerce_demo/constants/text_styles.dart';
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
      decoration: BoxDecoration(
        boxShadow: k3DShadows,
        color: kTileColor,
        borderRadius: BorderRadius.circular(10),
      ),
      height: height * 0.06,
      child: DropdownButton(
        iconSize: 20,
        padding: EdgeInsets.zero,
        value: _sortBy,
        underline: const SizedBox(),
        items: [
          for (var sortBy in SortBy.values)
            DropdownMenuItem(
              alignment: AlignmentDirectional.center,
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
    );
  }
}

Widget getDropdownIcon(SortBy sortBy) {
  switch (sortBy) {
    case SortBy.priceHi:
      return const Text('Price: Low to high', style: kSortTextStyle);
    case SortBy.priceLo:
      return const Text('Price: High to low', style: kSortTextStyle);
    case SortBy.rateHi:
      return const Text('Rating: Low to high', style: kSortTextStyle);
    case SortBy.rateLo:
      return const Text('Rating: High to low', style: kSortTextStyle);
    default:
      return const SizedBox();
  }
}
