import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/constants/shadows.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/products_list_screen.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController controller = TextEditingController();

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
              Icons.search,
              color: kDarkTextColor,
              size: 25.0,
            ),
          ),
          Flexible(
            child: TextField(
              controller: controller,
              textAlign: TextAlign.start,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() async {
                await ProductData.findProducts(controller.text);
                Navigator.pushNamed(context, ProductsListScreen.id);
              });
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
