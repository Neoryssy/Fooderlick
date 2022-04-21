import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/basket.dart';
import '../models/product.dart';

class ProductThumbnail extends StatelessWidget {
  final Product product;

  const ProductThumbnail({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              child: Image.asset(
                '${product.dishImage}',
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.title,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            '${product.price} руб',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Consumer<BasketModel>(builder: (context, cart, child) {
            return TextButton(onPressed: () {
              cart.addProduct(product);
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: const Text('Товар добавлен в корзину'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Ок'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });

            }, child: const Text('В корзину'),
            );
          })
        ],
      ),
    );
  }
}
