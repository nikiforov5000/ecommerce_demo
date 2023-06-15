import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/models/product_category.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/product_list_screen/products_list_screen.dart';
import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:ecommerce_demo/widgets/cart_icon/stream_builder.dart';
import 'package:ecommerce_demo/widgets/category_tile.dart';
import 'package:ecommerce_demo/widgets/icon_template.dart';
import 'package:ecommerce_demo/widgets/logo_home_button.dart';
import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/search_bar.dart';
import 'package:ecommerce_demo/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  static const String id = 'categories_screen';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<ProductCategory> categories = [];
  ProductData productData = ProductData();

  @override
  void initState() {
    _loadCategories();
    super.initState();
  }

  Future<void> _loadCategories() async {
    List<ProductCategory> loadedCategories = await ProductData.getCategories();
    setState(() {
      categories = loadedCategories;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const LogoHomeButton(),
        actions: [
          AppBarIconTemplate(child: const CartIconStreamBuilder()),
          AppBarIconTemplate(child: UserAvatarWidget()),
          AppBarIconTemplate(child: LogoutButton()),
        ],
      ),
      body: Container(
        color: kBackgroundColor,
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            MySearchBar(onChangesCallback: (value) {
              setState(() {
                displayedProducts = ProductData.products;
              });
              Navigator.pushNamed(context, ProductsListScreen.id);
            }),
            const SizedBox(
              height: 20.0,
            ),
            Flexible(
              child: GridView.count(
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
                          print(
                              'categories_screen.dart -> tapped ${category.name}');
                          await ProductData.getProductsOfCategory(
                              category.name);
                          Navigator.pushNamed(context, ProductsListScreen.id);
                        },
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
