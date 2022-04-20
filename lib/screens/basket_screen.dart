import 'package:flutter/material.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/basket_grid_view.dart';
import '../models/basket.dart';
import '../models/product.dart';
import '../components/globals.dart' as globals;

class BasketScreen extends StatelessWidget {
  final exploreService = MockFooderlichService();
  Basket basket = globals.basket;

  BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[BasketGridView(),];
    if (basket.products.length > 0) {
      children.add(
        TextButton(onPressed: () {
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: const Text('Товары куплены'),
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
      }, child: const Text('Купить')));
    }
    debugPrint(basket.toString());
    return FutureBuilder(
      future: exploreService.getProducts(),
      builder: (context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          debugPrint(snapshot.data.toString());
          return Column(children: children);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}