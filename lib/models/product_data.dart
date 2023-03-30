import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/models/product_category.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:ecommerce_demo/models/product.dart';

ProductData productData = ProductData();

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

class ProductData {
  static List<String> _categoriesImgUrls = [];
  final _auth = FirebaseAuth.instance;
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static List<Product> products = [];
  static List<ProductCategory> _categories = [];

  getCategoriesList() {
    return _categories;
  }

  getCategoriesImgUrls() {
    return _categoriesImgUrls;
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

  ProductCategory getCategoryAt(int index) {
    return _categories[index];
  }

  static getProductsOfCategory(String category) async {
    List<Product> _categoryProducts = [];
    print('product_data.dart -> getProductsOfCategory');
    QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('products')
        .where('category', whereIn: makeVariations(category))
        // .where('category', isEqualTo: category)
        .get();
    print(snapshot.size);
    for (var document in snapshot.docs) {
      _categoryProducts.add(Product.buildFromMap(document));
    }
    products = _categoryProducts;
    return products;
  }

  static Future<List<ProductCategory>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('categories').get();
      snapshot.docs.forEach((document) {
        print(document['name']);
        if (!_categories.any((element) => element.name == document['name'])) {
          _categories.add(ProductCategory(
            name: document['name'],
            imgUrl: document['imgUrl'],
          ));
        }
      });
    }
    catch (e) {
      print('product_data.dart -> getCategories() catch');
    }
    return await _categories;
  }

  static Future<List<Product>> getAllProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('products').get();
      snapshot.docs.forEach((document) {
        /// TODO remove category filling
        // if (!_categories.contains(document['category'])) {
        //   _categories.add(document['category']);
        //   _categoriesImgUrls.add(document['imgUrl']);
        // }
        products.add(Product.buildFromMap(document));
      });
      print('product_data.getAllProducts products.length:' +
          products.length.toString());
    }
    catch (e) {
      print('product_data.dart -> getAllProducts() catch');
    }
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

  static Future<void> findProducts(String text) async {
    products = [];

    await getAllProducts();
    text = text.trim();
    products.removeWhere((product) => !contains(text, product));
    print(products.length);
  }
}

bool contains(String text, Product product) {
  final bool ifContain = product.title.toLowerCase().contains(text.toLowerCase())
        || product.description.toLowerCase().contains(text.toLowerCase())
        || product.category.toLowerCase().contains(text.toLowerCase());
  print('${product.title} $text $ifContain');
  return ifContain;
}

List<String> makeVariations(String text) {
  text = text.trim();
  return [text, text.toLowerCase(), text.toUpperCase(), text.capitalize()];
}
