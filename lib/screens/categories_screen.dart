import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/widgets/category_tile.dart';
import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/product_tile.dart';
import 'package:ecommerce_demo/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {

  ProductData productData = ProductData();

  @override
  Widget build(BuildContext context) {
    ProductData.getAllProducts().then((value) => null);
    final categories = productData.getCategoriesList();
    final categoriesImgUrls = productData.getCategoriesImgUrls();
    print('categories_screen.dart -> categories.length:${categories.length}');
    return Scaffold(
      appBar: AppBar(
        title: Text('eCommerce'),
        actions: [
          UserAvatarWidget(),
          LogoutButton(),
        ],
      ),
      body:
      GridView.count(
        crossAxisCount: 2,
        children: [
          for (int i = 0; i < categories.length; ++i)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10.0,
              ),
              child: CategoryTile(
                category: categories[i],
                imageUrl: categoriesImgUrls[i],
                onTapCallback: () {
                  // Navigator.pushNamed(context, ProductScreen.id,
                  //     arguments: product);
                },
              ),
            )
        ],
      ),
    );
  }
}
