import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jumia/provider/Orders.dart';

class OrderItemLayout extends StatefulWidget {
  //const OrderItemLayout({ Key? key }) : super(key: key);
  final OrderItem orderItem;
  OrderItemLayout(this.orderItem);

  @override
  State<OrderItemLayout> createState() => _OrderItemLayoutState();
}

class _OrderItemLayoutState extends State<OrderItemLayout> {
  var _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text('\$${widget.orderItem.amount}'),
              subtitle: Text(DateFormat('dd/MM/yyyy hh:mm')
                  .format(widget.orderItem.dateTime)),
              trailing: IconButton(
                icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ),
            if (_isExpanded)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                height: min(widget.orderItem.products.length * 20.0 + 10, 100),
                child: ListView(
                    children: widget.orderItem.products
                        .map((e) => Row(
                              children: [
                                Text(
                                  e.title,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${e.quantity}x \$${e.price} ',
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                              ],
                            ))
                        .toList()),
              )
          ],
        ),
      ),
    );
  }
}
