import 'package:flutter/material.dart';

import '../models/basket.dart';
import '../models/basket_product.dart';
import '../models/product.dart';
import 'basket_product_thumbnail.dart';
import 'product_thumbnail.dart';
import '../components/globals.dart' as globals;

class BasketGridView extends StatefulWidget {

  const BasketGridView({Key? key}) : super(key: key);

  @override
  BasketGridViewState createState() => BasketGridViewState();
}

class BasketGridViewState extends State<BasketGridView> {
  Basket basket = globals.basket;
  bool i = false;

  @override
  Widget build(BuildContext context) {
    final products = <BasketProduct>[];
    basket.products.values.forEach((element) {
      products.add(element);
    });

    final deleteProductEvent = (Product product) {
      basket.deleteProduct(product);
      i = !i;
    };

    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: GridView.builder(
        itemCount: basket.products.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final product = products[index];
          return BasketProductThumbnail(product: product,
              deleteProductEvent: deleteProductEvent);
        }, shrinkWrap: true,
      ),
    );
  }
}