import 'package:flutter/material.dart';

import '../models/product.dart';
import 'product_thumbnail.dart';

class ProductsGridView extends StatelessWidget {
  final List<Product> products;

  const ProductsGridView({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductThumbnail(product: product);
        },
      ),
    );
  }
}