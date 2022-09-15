import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id, imageUrl, title, description;
  final double price;
  bool isFavorite;
  Product(
      {required this.id,
      required this.description,
      required this.imageUrl,
      this.isFavorite = false,
      required this.price,
      required this.title});

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
