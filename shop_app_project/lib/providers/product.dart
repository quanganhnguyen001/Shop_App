import 'package:flutter/foundation.dart';

class Product extends ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourites;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavourites = false,
  });

  void toggleFavourites(){
    isFavourites = !isFavourites;// neu false tra ve true va nguoc lai
    notifyListeners();
  }

}

