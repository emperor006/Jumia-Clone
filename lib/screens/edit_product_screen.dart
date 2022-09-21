import 'package:flutter/material.dart';
import 'package:jumia/provider/products.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';
  //const EditProductScreen({ Key? key }) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _prideFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  
  final _formkey = GlobalKey<FormState>();
  var _product =
      Product(id: "", description: "", imageUrl: "", price: 0, title: "");

  @override
  void dispose() {
    // TODO: implement dispose
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlController.removeListener(() {});
    _prideFocusNode.dispose();
    super.dispose();
  }

  String text = "";
  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    _imageUrlController.addListener(() {
      setState(() {
        text = _imageUrlController.text;
      });
    });
  }

  void saveForm() {
    _formkey.currentState!.save();
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formkey,
            child: ListView(
              children: [
                TextFormField(
                  onSaved: ((newValue) => _product = Product(
                      id: _product.id,
                      description: _product.description,
                      imageUrl: _product.imageUrl,
                      price: _product.price,
                      title: newValue.toString())),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_prideFocusNode),
                  decoration: const InputDecoration(label: Text('title')),
                ),
                TextFormField(
                  onSaved: ((newValue) => _product = Product(
                      id: _product.id,
                      description: _product.description,
                      imageUrl: _product.imageUrl,
                      price: double.parse(newValue.toString()),
                      title: _product.title)),
                  focusNode: _prideFocusNode,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (_) => FocusScope.of(context)
                      .requestFocus(_descriptionFocusNode),
                  decoration: const InputDecoration(label: Text('price')),
                ),
                TextFormField(
                  onSaved: ((newValue) => _product = Product(
                      id: _product.id,
                      description: newValue.toString(),
                      imageUrl: _product.imageUrl,
                      price: _product.price,
                      title: _product.title)),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  focusNode: _descriptionFocusNode,
                  decoration: const InputDecoration(label: Text('description')),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.only(
                        top: 8,
                        right: 10,
                      ),
                      child: text.isEmpty
                          ? const Text('Enter Image Url')
                          : FittedBox(
                              child: Image.network(
                                text,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    Expanded(
                      child: TextFormField(
                        onSaved: ((newValue) => _product = Product(
                            id: _product.id,
                            description: _product.description,
                            imageUrl: newValue.toString(),
                            price: _product.price,
                            title: _product.title)),
                        controller: _imageUrlController,
                        decoration:
                            const InputDecoration(label: Text('Image Url')),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                      ),
                    )
                  ],
                ),
                ElevatedButton(onPressed: saveForm, child: const Text('Submit'))
              ],
            )),
      ),
    );
  }
}
