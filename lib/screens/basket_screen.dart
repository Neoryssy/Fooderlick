import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/basket_grid_view.dart';
import '../models/basket.dart';
import '../models/product.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BasketScreenState();

}

class _BasketScreenState extends State<BasketScreen> {
  final exploreService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreService.getProducts(),
      builder: (context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Consumer<BasketModel>(builder: (context, cart, child) {
            final children = <Widget>[
              const Flexible(child: BasketGridView()),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Купить',
                            style: TextStyle(fontSize: 20,),
                          ),
                        ),
                        onPressed: () {
                          cart.clearCart();
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
                        },
                      )
                  ))
            ];

            if (cart.products.length < 1) {
              return Column(children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Корзина пуста',
                    style: TextStyle(
                      fontSize: 40
                    ),
                  ),
                )
              ],);
            }
            else {
              return Column(
                children: children,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              );
            }
          });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
