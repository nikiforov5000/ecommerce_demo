import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/models/product_category.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/models/shoppint_cart/shopping_cart.dart';
import 'package:ecommerce_demo/screens/product_screen.dart';
import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:ecommerce_demo/widgets/category_button.dart';
import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/product_tile.dart';
import 'package:ecommerce_demo/widgets/search_bar.dart';
import 'package:ecommerce_demo/widgets/sort_bar.dart';
import 'package:ecommerce_demo/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Product> currentProducts = [];

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
      currentProducts = ProductData.products;
      print(
          'product_list_screen.dart -> currentProducts.length:${currentProducts.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final _shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);
    final _shoppingCart = _shoppingCartProvider.shoppingCart;
    print('product_list_screen -> shoppingCart.id:' + _shoppingCart!.id);
    print('ProductsListScreen().build');
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('eCommerce Demo'),
        actions: [
          // Text(_shoppingCart!.id, style: TextStyle(color: Colors.black),),
          LogoutButton(),
          UserAvatarWidget(),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        color: kBackgroundColor,
        child: Column(children: [
          SizedBox(height: 15.0),
          SearchBar(onChangesCallback: (value) {
            setState(() {
              currentProducts = ProductData.products;
            });
          }),
          SizedBox(height: 15.0),
        Container(
          height: height * 0.04,
          child: Row(
                children: [
                  SortBar(onChangesCallback: (value) {
                    setState(() {
                      currentProducts = ProductData.products;
                    });
                  }),
                  Flexible(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CategoryButton(
                          label: 'All products',
                          onTapCallback: () {
                            ProductData.getAllProducts().then((products) {
                              setState(() {
                                currentProducts = products;
                              });
                            });
                          },
                        ),
                        for (ProductCategory category
                            in productData.getCategoriesList())
                          CategoryButton(
                            label: category.name,
                            onTapCallback: () {
                              ProductData.getProductsOfCategory(category.name)
                                  .then((products) {
                                setState(() {
                                  currentProducts = products;
                                });
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: ProductsList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    print('ProductList build');
    return GridView.count(
      crossAxisCount: 2,
      children: [
        for (var product in currentProducts)
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: ProductTile(
              product: product,
              onTapCallback: () {
                print('ProductList.buld ' + product.title + ' was tapped');
                Navigator.pushNamed(context, ProductScreen.id,
                    arguments: product);
              },
            ),
          )
      ],
    );
  }
}
