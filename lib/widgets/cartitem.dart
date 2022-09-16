import 'package:flutter/material.dart';
import 'package:jumia/provider/cart.dart';
import 'package:provider/provider.dart';

class CartItemLayout extends StatelessWidget {
  //const CartItem({ Key? key }) : super(key: key);
  final String title, id, productId;
  final double price;
  final int quantity;

  CartItemLayout(this.id, this.title, this.price, this.quantity, this.productId);

  @override
  Widget build(BuildContext context) {


    return Dismissible(
      onDismissed: (direction) =>Provider.of<Cart>(context, listen: false).removeItem(productId)  ,
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        child: const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.delete,
              size: 40,
              color: Colors.white,
            )),
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
      ),


      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: FittedBox(child: Text('\$${price}')))),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
