import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String title;
  final double price;
  final String imgUrl;
  final String description;
  final double rate;
  final String category;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imgUrl,
    required this.description,
    required this.rate,
    required this.category,
  });

  String getShortTitle() {
    return title.split(' ').getRange(0, 2).join(' ');
  }

  static Product buildFromMap(DocumentSnapshot data) {
    return Product(
        id: data['id'],
        title: data['title'],
        price: data['price'],
        imgUrl: data['imgUrl'],
        description: data['description'],
        rate: data['rate'],
        category: data['category']);
  }
}
