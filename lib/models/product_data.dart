import 'dart:convert';

import 'package:ecommerce_demo/models/product.dart';
import 'package:http/http.dart' as http;

ProductData productData = ProductData();

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

class ProductData {
  List<Product> _products = [];
  Map<String, int> _categoriesMap = {};

  Future<bool> fetchData() async {
    http.Client client = http.Client();
    String url = 'https://fakestoreapi.com/products';
    var uri = Uri.parse(url);
    try {
      var response = await client.get(uri);
      // client.close();
      if (response.statusCode == 200 && response.body.length > 10) {
        var decodedResponse = jsonDecode(response.body);
        // print(decodedResponse[6]);
        fillProductList(decodedResponse);
      } else {
        print('response BAD');
        print(response.statusCode);
      }
    } catch (e) {
      print('uri ' + uri.toString());
      print('product_data.dart -> fetchData() error:' + e.toString());
    }
    return true;
  }

  void fillProductList(decodedResponse) {
    int k = 0;
    for (int i = 0; i < 20; ++i) {
      var response = decodedResponse[i];

      String category = response['category'];
      category = category.capitalize();

      _categoriesMap.putIfAbsent(category, () => k++);

      _products.add(
        Product(
          title: response['title'],
          price: response['price'].toDouble(),
          imgUrl: response['image'],
          discription: response['description'],
          rate: response['rating']['rate'].toDouble(),
          category: category,
        )
      );
    }
  }

  getCategoriesList() {
    return _categoriesMap.keys;
  }

  getProduct(int index) {
    print(_products.length > index);
    return _products[index];
  }

  int getLength() {
    return _products.length;
  }

  int getCategoriesLength() {
    return _categoriesMap.length;
  }

  String getCategoryAt(int index) {
    return _categoriesMap.keys.toList()[index];
  }

  getProductsOfCategory(String currentCategory) {
    if (_categoriesMap.containsKey(currentCategory)) {
      return _products.where((product) => product.category == currentCategory).toList();
    }
    return _products;
  }

  List<Product> getAllProducts() {
    return _products;
  }
}
