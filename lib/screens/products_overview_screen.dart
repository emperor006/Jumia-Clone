import 'package:flutter/material.dart';
import 'package:jumia/provider/cart.dart';
import 'package:jumia/provider/products.dart';
import 'package:jumia/provider/products_provider.dart';
import 'package:jumia/screens/cart_screen.dart';
import 'package:jumia/widgets/app_drawer.dart';
import 'package:jumia/widgets/badge.dart';
import 'package:jumia/widgets/products_grid.dart';
import 'package:jumia/widgets/products_layout.dart';
import 'package:provider/provider.dart';

enum FilterOption { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showFavorites = false;

  @override
  Widget build(BuildContext context) {
    final productsContainer =
        Provider.of<ProductsProvider>(context, listen: false);
    //final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jumia'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption selectedValue) {
              setState(() {
                switch (selectedValue) {
                  case FilterOption.Favorites:
                    //productsContainer.showFavoritesOnly()
                    _showFavorites = true;
                    break;

                  case FilterOption.All:
                    _showFavorites = false;
                    //productsContainer.showAll();
                    break;
                }
              });
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOption.Favorites,
              ),
              const PopupMenuItem(
                child: Text('Show All'),
                value: FilterOption.All,
              ),
            ],
            icon: const Icon(Icons.more_vert),
          ),
          Consumer<Cart>(
              //wont be rebuilt when consumer triggers rebuild of cart widget
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  icon: Icon(Icons.shop)),
              builder: (_, cart, childWidget) => Badge(
                  child: childWidget as Widget,
                  value: cart.itemCount.toString(),
                  color: Colors.red)),
        ],
      ),
      body: ProductsGrid(_showFavorites),

      drawer: AppDrawer(),
    );
  }
}
