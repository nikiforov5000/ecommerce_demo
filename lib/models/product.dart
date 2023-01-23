class Product {
  final String title;
  final double price;
  final String imgUrl;
  final String discription;
  final double rate;
  final String category;

  Product({
    required this.title,
    required this.price,
    required this.imgUrl,
    required this.discription,
    required this.rate,
    required this.category,
  });

  String getShortTitle() {
    return title.split(' ').getRange(0, 2).join(' ');
  }
}
