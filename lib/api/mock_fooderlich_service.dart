import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/product.dart';

// Mock recipe service that grabs sample json data to mock recipe request/response
class MockFooderlichService {
  Future<List<Product>> getProducts() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Load json from file system
    final dataString =
    await _loadAsset('sample_data/sample_products.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // Go through each recipe and convert json to SimpleRecipe object.
    if (json['products'] != null) {
      final recipes = <Product>[];
      json['products'].forEach((v) {
        recipes.add(Product.fromJson(v));
      });
      return recipes;
    } else {
      return [];
    }
  }

  // Loads sample json data from file system
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
