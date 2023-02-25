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
    QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('products')
        .where('category', isEqualTo: category)
        .get();
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
