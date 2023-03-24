import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {

  ProductData productData = ProductData();

  @override
  Widget build(BuildContext context) {
    final categories = productData.getCategoriesList();

    return Scaffold(
      appBar: AppBar(
        title: Text('eCommerce'),
        actions: [
          UserAvatarWidget(),
          LogoutButton(),
        ],
      ),
      body: Placeholder(),
      // GridView.count(
      //   crossAxisCount: 2,
      //   children: [
      //     for (var product in currentProducts)
      //       Padding(
      //         padding:
      //         const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      //         child: ProductTile(
      //           product: product,
      //           onTapCallback: () {
      //             print('ProductList.buld ' + product.title + ' was tapped');
      //             Navigator.pushNamed(context, ProductScreen.id,
      //                 arguments: product);
      //           },
      //         ),
      //       )
      //   ],
      // ),
    );
  }
}
