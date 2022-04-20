import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';
import '../models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleImage(
          imageProvider: AssetImage('${product.dishImage}'),
          imageRadius: 20,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.title),
              Text(
                'x',
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
        )
      ],
    );
  }
}
