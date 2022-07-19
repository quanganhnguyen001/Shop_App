

import 'package:flutter/foundation.dart';


class CartItem{
  final String id;
  final String title;
  final double price;
  final int quanity;

  CartItem({required this.id, required this.title, required this.price, required this.quanity});
}

class Cart extends ChangeNotifier{
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items{
    return {..._items};
  }

  int get itemCount{
    // return _items.length == null ? 0: _items.length;
    return _items.length;
  }

  double get totalAmount{
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quanity;
    });
    return total;
  }

  void addItem(String productId, double price, String title){
    if(_items.containsKey(productId)){
      _items.update(productId, (existingItem) => CartItem(id: existingItem.id, price: existingItem.price, quanity: existingItem.quanity + 1, title: existingItem.title));
    }else{
      _items.putIfAbsent(productId, () => CartItem(
        id: DateTime.now().toString(), title: title, price: price, quanity: 1)
      );
    }
    notifyListeners();
  }

  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }

  void clearOrder(){
    _items = {};
    notifyListeners();
  }
}