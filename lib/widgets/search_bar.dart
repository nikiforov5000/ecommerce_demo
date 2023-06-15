import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/constants/shadows.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  final Function onChangesCallback;
  MySearchBar({required this.onChangesCallback});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14.0),
      height: height * 0.06,
      decoration: BoxDecoration(
        boxShadow: k3DShadows,
        color: kTileColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Icon(Icons.search, color: kDarkTextColor, size: 25.0),
          ),
          Flexible(
            child: TextField(
              controller: controller,
              textAlign: TextAlign.start,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await ProductData.findProducts(controller.text);
              widget.onChangesCallback(controller.text);
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffc1c2c9),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Center(child: Text('Find')),
            ),
          ),
        ],
      ),
    );
  }
}
