import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/product_list_screen/widgets/category_bar.dart';
import 'package:ecommerce_demo/screens/product_list_screen/widgets/product_list.dart';
import 'package:ecommerce_demo/screens/product_list_screen/widgets/sort_bar.dart';
import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:ecommerce_demo/widgets/cart_icon/stream_builder.dart';
import 'package:ecommerce_demo/widgets/icon_template.dart';
import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/search_bar.dart';
import 'package:ecommerce_demo/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Product> displayedProducts = [];

class ProductsListScreen extends StatefulWidget {
  static const String id = 'productListScreen';

  const ProductsListScreen({Key? key}) : super(key: key);

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      displayedProducts = ProductData.products;
      print(
        'product_list_screen.dart -> currentProducts.length:${displayedProducts.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final _shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);
    final _shoppingCart = _shoppingCartProvider.shoppingCart;
    print('product_list_screen -> shoppingCart.id:' + _shoppingCart!.id);
    print('ProductsListScreen().build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('eCommerce Demo'),
        actions: [
          AppBarIconTemplate(child: const CartIconStreamBuilder()),
          AppBarIconTemplate(child: UserAvatarWidget()),
          AppBarIconTemplate(child: LogoutButton()),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        color: kBackgroundColor,
        child: Column(
          children: [
            const SizedBox(height: 15.0),
            SearchBar(onChangesCallback: (value) {
              setState(() {
                displayedProducts = ProductData.products;
              });
            }),
            const SizedBox(height: 15.0),
            Row(
              children: [
                SortBar(onChangesCallback: (value) {
                  setState(() {
                    displayedProducts = ProductData.products;
                  });
                }),
                CategoryBar(onCategoryChanged: () {
                  setState(() {
                    displayedProducts = ProductData.products;
                  });
                }),
              ],
            ),
            ProductsList(),
          ],
        ),
      ),
    );
  }
}
