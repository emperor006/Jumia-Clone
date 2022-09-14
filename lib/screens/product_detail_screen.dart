import 'package:flutter/material.dart';
import 'package:jumia/provider/products_provider.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)?.settings.arguments as String;
    Product product = Provider.of<ProductsProvider>(context,listen: false).getProductById(id);
    return Scaffold(
      appBar: AppBar(title: Text(product.title),),
    );
  }
}
