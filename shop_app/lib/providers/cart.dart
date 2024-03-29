import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem({
    @required this.title,
    @required this.price,
    @required this.quantity,
    @required this.id,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                title: existingCartItem.title,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity + 1,
                id: existingCartItem.id,
              ));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
                title: title,
                price: price,
                quantity: 1,
                id: DateTime.now().toString(),
              ));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) return;

    if (_items[productId].quantity > 1) {
      _items.update(
          productId,
          (exitingCartITem) => CartItem(
                title: exitingCartITem.title,
                price: exitingCartITem.price,
                quantity: exitingCartITem.quantity - 1,
                id: exitingCartITem.id,
              ));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }
}
