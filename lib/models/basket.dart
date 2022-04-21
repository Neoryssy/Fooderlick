import 'package:flutter/cupertino.dart';

import 'basket_product.dart';
import 'product.dart';

class BasketModel extends ChangeNotifier {
  Map<String, BasketProduct> products = Map();

  void addProduct(Product product) {
    if (products[product.title] != null) {
      products[product.title]?.increaseCount();
    } else {
      products[product.title] =
      BasketProduct(
          product.title,
          product.price,
          product.dishImage
      );
    }

    notifyListeners();
  }
  void clearCart() {
    products.clear();

    notifyListeners();
  }
  void removeProduct(String title) {
    if (products[title] != null) {
      products[title]?.decreaseCount();
      if (products[title]!.count < 1) {deleteProduct(title);}
    }

    notifyListeners();
  }
  void deleteProduct(String title) {
    if (products[title] != null) {
      products.remove(title);
    }

    notifyListeners();
  }
}