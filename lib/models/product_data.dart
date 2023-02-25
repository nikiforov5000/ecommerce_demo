import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

ProductData productData = ProductData();

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

class ProductData {
  final _auth = FirebaseAuth.instance;
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static List<Product> products = [];
  static List<String> _categories = [];

  // Future<bool> fetchData() async {
  //   http.Client client = http.Client();
  //   String url = 'https://fakestoreapi.com/products';
  //   var uri = Uri.parse(url);
  //   try {
  //     var response = await client.get(uri);
  //     if (response.statusCode == 200 && response.body.length > 10) {
  //       var decodedResponse = jsonDecode(response.body);
  //       fillProductList(decodedResponse);
  //     } else {
  //       print('response BAD');
  //       print(response.statusCode);
  //     }
  //   } catch (e) {
  //     print('uri ' + uri.toString());
  //     print('product_data.dart -> fetchData() error:' + e.toString());
  //   }
  //   return true;
  // }

  // void fillProductList(decodedResponse) {
  //   int k = 0;
  //   for (int i = 0; i < 20; ++i) {
  //     var response = decodedResponse[i];
  //
  //     String category = response['category'];
  //     category = category.capitalize();
  //
  //     _categories.putIfAbsent(category, () => k++);
  //
  //     _products.add(Product(
  //       title: response['title'],
  //       price: response['price'].toDouble(),
  //       imgUrl: response['image'],
  //       description: response['description'],
  //       rate: response['rating']['rate'].toDouble(),
  //       category: category,
  //     ));
  //   }
  // }

  getCategoriesList() {
    return _categories;
  }

  getProduct(int index) {
    return products[index];
  }

  int getLength() {
    return products.length;
  }

  int getCategoriesLength() {
    return _categories.length;
  }

  String getCategoryAt(int index) {
    return _categories[index];
  }

  static getProductsOfCategory(String category) async {
    List<Product> products = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('products').where('category', isEqualTo: category).get();
    snapshot.docs.forEach((document) {
      products.add(Product.buildFromMap(document));
    });
    return products;
  }

  static Future<List<Product>> getAllProducts() async {
    List<Product> products = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('products').get();
    snapshot.docs.forEach((document) {
      if (!_categories.contains(document['category'])) {
        _categories.add(document['category']);
      }
      products.add(Product.buildFromMap(document));
    });
    print('product_data.getAllProducts products.length:' +
        products.length.toString());
    return products;
  }

  static getCurrentProducts() {
    if (products.length == 0) {
      getAllProducts();
    }
    print('product_data.getCurrentProducts products.length:' +
        products.length.toString());
    return products;
  }
}
