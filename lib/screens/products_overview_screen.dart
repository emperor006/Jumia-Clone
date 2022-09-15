import 'package:flutter/material.dart';
import 'package:jumia/provider/products.dart';
import 'package:jumia/provider/products_provider.dart';
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
        ],
      ),
      body: ProductsGrid(_showFavorites),
    );
  }
}
