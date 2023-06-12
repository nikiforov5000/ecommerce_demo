import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/product_screen/widgets/hyperlink_text.dart';
import 'package:flutter/material.dart';

class Breadcrumbs extends StatelessWidget {
  final Product _product;

  const Breadcrumbs(this._product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HyperlinkText(_product.category.capitalize()),
        Text(' / '),
        Expanded(
            child: Text(
          _product.title.capitalize(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        )),
      ],
    );
  }
}
