import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/models/product_category.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/categories_screen/category_grid.dart';
import 'package:ecommerce_demo/screens/product_list_screen/products_list_screen.dart';
import 'package:ecommerce_demo/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class CategoriesBody extends StatefulWidget {
  const CategoriesBody({Key? key}) : super(key: key);

  @override
  State<CategoriesBody> createState() => _CategoriesBodyState();
}

class _CategoriesBodyState extends State<CategoriesBody> {
  late Future<List<ProductCategory>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = ProductData.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          MySearchBar(
            onChangesCallback: (value) {
              Navigator.pushNamed(context, ProductsListScreen.id);
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          Flexible(
            child: FutureBuilder<List<ProductCategory>>(
                future: futureCategories,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error loading categories');
                  } else {
                    return CategoryGrid(categories: snapshot.data!);
                  }
                }),
          ),
        ],
      ),
    );
  }
}
