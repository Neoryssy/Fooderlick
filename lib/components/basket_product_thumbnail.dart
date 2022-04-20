import 'package:flutter/material.dart';

import '../models/basket_product.dart';
import '../models/models.dart';
import '../models/product.dart';
import 'globals.dart';

class BasketProductThumbnail extends StatelessWidget {
  final BasketProduct product;
  final deleteProductEvent;

  const BasketProductThumbnail({
    Key? key,
    required this.product,
    required this.deleteProductEvent,
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
                '${product.imgUri}',
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

          Row(children: [
            TextButton(onPressed: () {
              basket.removeProduct(Product(
                  dishImage: product.imgUri,
                  title: product.title,
                  price: product.price
              ));
            } , child: const Text('-'),),
            Text('x${product.count.toString()}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextButton(onPressed: () {
              basket.addProduct(Product(
                  dishImage: product.imgUri,
                  title: product.title,
                  price: product.price
              ));
            } , child: const Text('+'),)
          ]),
          Text( '${(product.price * product.count).toString()} руб',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TextButton(onPressed: () {
            deleteProductEvent(
                Product(
                    dishImage: product.imgUri,
                    title: product.title,
                    price: product.price
                )
            );
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: const Text('Товар удален из корзины'),
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
          }, child: const Text('Удалить из корзины'),)
        ],
      ),
    );
  }
}
