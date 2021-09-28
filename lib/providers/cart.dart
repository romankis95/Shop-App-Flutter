import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  // Map<String, CartItem> _items = {};

  Map<String, CartItem> get _items {
    return {..._items};
  }

  void addItem(String productId, double price, String title) {
    ///praticamente controllo il mio carrello quando uso addItem,
    ///se il mio carrello attuale (_items) contiene già un prodotto uguale,
    ///ne incremento la qta, altrimenti inserisco una nuova riga nel carrello;
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      //aggiungo una nuova riga
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1));
    }
  }
}
