import 'package:flutter/cupertino.dart';
import 'package:jumia/provider/products.dart';

class ProductsProvider with ChangeNotifier {
  //list of products must not be accessible outside
  List<Product> _list = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

//create listeners to access it
  // var _showFavoritesOnly = false;
  List<Product> get items {
    // switch (_showFavoritesOnly) {
    //   case true:
    //     return _list
    //         .where((element) => element.isFavorite == _showFavoritesOnly)
    //         .toList();
    //     break;
    // }

    return [..._list];
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  List<Product> get showOnlyFavorite {
    return _list.where((element) => element.isFavorite == true).toList();
  }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  /*
 it is very important to only change data in the _list 
  within this classs only because if not done within this 
  class, it would not be possible to notify all child
  widgets that are listening of this change(i.e by calling notifyListeners()).
  */
  void addProducts(Product product) {
    final initialProduct = Product(
        id: product.id,
        description: product.description,
        imageUrl: product.imageUrl,
        price: product.price,
        title: product.title);
    //_list.add(initialProduct);
    _list.insert(0, initialProduct);
    notifyListeners();
  }

  Product getProductById(String id) {
    return items.firstWhere(
      (element) => element.id == id,
    );
  }
}
