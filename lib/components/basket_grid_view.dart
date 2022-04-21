import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/basket.dart';
import '../models/basket_product.dart';
import 'basket_product_thumbnail.dart';

class BasketGridView extends StatefulWidget {
  const BasketGridView({Key? key}) : super(key: key);

  @override
  BasketGridViewState createState() => BasketGridViewState();
}

class BasketGridViewState extends State<BasketGridView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BasketModel>(builder: (context, cart, child) {
      final products = <BasketProduct>[];
      cart.products.values.forEach((element) {
        products.add(element);
      });

      return Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        child: GridView.builder(
          itemCount: cart.products.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            final product = products[index];
            return BasketProductThumbnail(product: product);
          }, shrinkWrap: true,
        ),
      );
    });
  }
}