import 'dart:convert';

import 'package:ecommerce_demo/models/product.dart';
import 'package:http/http.dart' as http;

ProductData productData = ProductData();

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
      if ( !_categoriesMap.containsKey(response['category']) ) {
        _categoriesMap.putIfAbsent(response['category'], () => k++);
      }
      _products.add(
        Product(
          title: response['title'],
          price: response['price'].toDouble(),
          imgUrl: response['image'],
          discription: response['description'],
          rate: response['rating']['rate'].toDouble(),
          category: response['category'],
        )
      );
    }
  }

  getCategories() {
    return _categoriesMap;
  }

  getProduct(int index) {
    print(_products.length > index);
    return _products[index];
  }

  int getLength() {
    return _products.length;
  }
}
