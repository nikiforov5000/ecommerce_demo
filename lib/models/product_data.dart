import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/models/product_category.dart';
import 'package:ecommerce_demo/screens/product_list_screen/widgets/sort_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:ecommerce_demo/models/product.dart';

ProductData productData = ProductData();

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

class ProductData {
  static final List<String> _categoriesImgUrls = [];
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static List<Product> products = [];
  static final List<ProductCategory> _categories = [];

  static getProduct(String id) {
    for (var product in products) {
      if (product.id == id) { return product; }
    }
  }

  getCategoriesList() {
    return _categories;
  }

  getCategoriesImgUrls() {
    return _categoriesImgUrls;
  }

  getProductAt(int index) {
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

  // static addIdToAllProducts() async {
  //   QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
  //       .collection('products')
  //       .get();
  //   for (var doc in snapshot.docs) {
  //     _firestore.collection('products').doc(doc.id).update({
  //       'id': doc.id
  //     });
  //   }
  // }

  static getProductsOfCategory(String category) async {
    List<Product> categoryProducts = [];
    QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('products')
        .where('category', whereIn: makeVariations(category))
        .get();
    for (var document in snapshot.docs) {
      categoryProducts.add(Product.buildFromMap(document));
    }
    products = categoryProducts;
    return products;
  }

  static Future<List<ProductCategory>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('categories').get();
      for (var document in snapshot.docs) {
        if (!_categories.any((element) => element.name == document['name'])) {
          _categories.add(ProductCategory(
            name: document['name'],
            imgUrl: document['imgUrl'],
          ));
        }
      }
    }
    catch (e) {
      print('product_data.dart -> getCategories() catch');
    }
    return _categories;
  }

  static Future<List<Product>> getAllProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('products').get();
      for (var document in snapshot.docs) {
        products.add(Product.buildFromMap(document));
      }
    }
    catch (e) {
      print('product_data.dart -> getAllProducts() catch');
    }
    return products;
  }

  static getCurrentProducts() {
    if (products.isEmpty) {
      getAllProducts();
    }
    return products;
  }

  static Future<void> findProducts(String text) async {
    products = [];
    await getAllProducts();
    text = text.trim();
    products.removeWhere((product) => !contains(text, product));
  }

  static void sortProducts(SortBy sortBy) {
    switch(sortBy) {
      case SortBy.priceHi:
        products.sort((Product a, Product b) => a.price.compareTo(b.price));
        break;
      case SortBy.priceLo:
        products.sort((Product a, Product b) => b.price.compareTo(a.price));
        break;
      case SortBy.rateHi:
        products.sort((Product a, Product b) => a.rate.compareTo(b.rate));
        break;
      case SortBy.rateLo:
        products.sort((Product a, Product b) => b.rate.compareTo(a.rate));
        break;
      default:
        break;
    }
  }
}

bool contains(String text, Product product) {
  final bool ifContain = product.title.toLowerCase().contains(text.toLowerCase())
        || product.description.toLowerCase().contains(text.toLowerCase())
        || product.category.toLowerCase().contains(text.toLowerCase());
  return ifContain;
}

List<String> makeVariations(String text) {
  text = text.trim();
  return [text, text.toLowerCase(), text.toUpperCase(), text.capitalize()];
}
