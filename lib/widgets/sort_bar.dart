import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/constants/shadows.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:flutter/material.dart';

class SortBar extends StatefulWidget {
  const SortBar({Key? key}) : super(key: key);

  @override
  State<SortBar> createState() => _SortBarState();
}

class _SortBarState extends State<SortBar> {
  bool sortPriceLoToHi = false;
  bool sortPriceHiToLo = false;
  @override
  Widget build(BuildContext context) {

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
          GestureDetector(
            onTap: () {
              setState(() {
                sortPriceLoToHi = true;
                sortPriceHiToLo = false;
                ProductData.sortPriceLoToHi();
              });
            },
            child: Center(
              child: Text('Price Low to High'),
            ),
          ),
        ],
      ),
    );
  }
}
