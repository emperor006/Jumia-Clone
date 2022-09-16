// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:jumia/provider/Orders.dart';
import 'package:jumia/provider/cart.dart';
import 'package:jumia/widgets/cartitem.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  //const CartScreen({ Key? key }) : super(key: key);
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    Chip(
                      label: Text(
                        '\$${cart.totalAmount.toStringAsFixed(2)}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    FlatButton(
                        onPressed: () {
                          Provider.of<Orders>(context, listen: false).addOrders(
                              cart.items.values.toList(), cart.totalAmount);

                          cart.clearCart();
                        },
                        child: Text(
                          'ORDER NOW',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ))
                  ],
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: cart.itemCount,
                  itemBuilder: ((context, index) => CartItemLayout(
                      cart.items.values.toList()[index].id,
                      cart.items.values.toList()[index].title,
                      cart.items.values.toList()[index].price,
                      cart.items.values.toList()[index].quantity,
                      cart.items.keys.toList()[index]))))
        ],
      ),
    );
  }
}
