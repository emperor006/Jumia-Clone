import 'package:flutter/material.dart';
import 'package:jumia/provider/products_provider.dart';
import 'package:jumia/widgets/app_drawer.dart';
import 'package:jumia/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatelessWidget {
  // const UserProductScreen({ Key? key }) : super(key: key);
  static const routeName = '/user-product';

  @override
  Widget build(BuildContext context) {
    final productObject = Provider.of<ProductsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: productObject.items.length,
            itemBuilder: (ctx, index) => Column(
                  children: [
                    UserProductItem(productObject.items[index].imageUrl,
                        productObject.items[index].title),
                    const Divider(),
                  ],
                )),
      ),
    );
  }
}
