import 'package:flutter/material.dart';
import 'package:jumia/provider/products.dart';
import 'package:jumia/widgets/products_grid.dart';
import 'package:jumia/widgets/products_layout.dart';

class ProductsOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jumia'),
      ),
      body: ProductsGrid(),
    );
  }
}
