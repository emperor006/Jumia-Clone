import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  //const UserProductItem({ Key? key }) : super(key: key);
  String imageUrl, title;
  UserProductItem(this.imageUrl, this.title);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(title),
      trailing: Container(
        width: 100,
        child: Row(children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.blue,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red,)),

        ],),
      ),
    );
  }
}
