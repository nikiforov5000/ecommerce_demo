import 'package:ecommerce_demo/models/product_category.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/products_list_screen.dart';
import 'package:ecommerce_demo/widgets/category_tile.dart';
import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/product_tile.dart';
import 'package:ecommerce_demo/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {


  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  List<ProductCategory> categories = [];
  ProductData productData = ProductData();

  @override
  void initState() {
  // TODO: implement initState
    _loadCategories();
    super.initState();
  }

  Future<void> _loadCategories() async {
    List<ProductCategory> loadedCategories = await
        ProductData.getCategories();
    setState(() {
      categories = loadedCategories;
    });
  }

  @override
  Widget build(BuildContext context) {
    // setCategories();
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
          for (ProductCategory category in categories)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10.0,
              ),
              child: CategoryTile(
                category: category,
                onTapCallback: () async {
                  print('categories_screen.dart -> tapped ${category.name}');
                  await ProductData.getProductsOfCategory(category.name);
                  Navigator.pushNamed(context, ProductsListScreen.id);
                },
              ),
            )
        ],
      ),
    );
  }
}
