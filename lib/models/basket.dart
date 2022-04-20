import 'package:flutter/cupertino.dart';

import 'basket_product.dart';
import 'product.dart';

class Basket {
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
  }
  void removeProduct(Product product) {
    if (products[product.title] != null) {
      products[product.title]?.decreaseCount();
      if (products[product.title]!.count < 1) {deleteProduct(product);}
    } else {
      return;
    }
  }
  void deleteProduct(Product product) {
    if (products[product.title] != null) {
      products.remove(product.title);
    } else {
      return;
    }
  }
}