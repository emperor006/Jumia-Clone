import 'package:flutter/material.dart';
import 'package:jumia/provider/Orders.dart';
import 'package:jumia/widgets/app_drawer.dart';
import 'package:jumia/widgets/orderlayout.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  //const OrdersScreen({ Key? key }) : super(key: key);
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderItemLayout(orderData.orders[i]),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
