import 'dart:convert';

import 'package:ecommerce_demo/models/product.dart';
import 'package:http/http.dart' as http;

ProductData productData = ProductData();

class ProductData {
  List<Product> _products = [];

  void fetchData() async {
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
  }

  void fillProductList(decodedResponse) {
    for (int i = 6; i < 20; ++i) {
      var response = decodedResponse[i];
      print(response);
      print('${response['title']} ${response['price']} ${response['image']}');
      _products.add(
        Product(
          title: response['title'],
          price: response['price'].toDouble(),
          imgUrl: response['image']
        )
      );
    }
  }

  getProduct(int index) {
    print(_products.length > index);
    return _products[index];
  }
}
