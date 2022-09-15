import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';
import '../provider/products_provider.dart';
import 'products_layout.dart';

class ProductsGrid extends StatelessWidget {
  bool showFavorites;

  ProductsGrid(this.showFavorites);
  //const ProductsGrid({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    List<Product> productList = showFavorites? productsData.showOnlyFavorite :productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: productList[i], child: ProductItem()),
      itemCount: productList.length,
    );
  }
}
