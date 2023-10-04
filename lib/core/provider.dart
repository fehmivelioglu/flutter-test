import 'package:flutter/material.dart';

class BasketProvider extends ChangeNotifier {
  // BasketProvider.init();

  bool basket = false;

  void refreshBasket() {
    basket = !basket;
    notifyListeners();
  }
}
