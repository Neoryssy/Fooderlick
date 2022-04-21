import 'package:flutter/material.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/products_grid_view.dart';
import '../models/product.dart';

class ToBuyScreen extends StatelessWidget {
  final exploreService = MockFooderlichService();

  ToBuyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreService.getProducts(),
      builder: (context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ProductsGridView(products: snapshot.data ?? [],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}