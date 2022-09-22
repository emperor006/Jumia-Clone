import 'package:flutter/material.dart';
import 'package:jumia/provider/products.dart';
import 'package:jumia/provider/products_provider.dart';
import 'package:provider/provider.dart';

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

  String id = "";

  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)!.settings.arguments as String;
    super.didChangeDependencies();
  }

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
    final val = _formkey.currentState!.validate();
    if (!val) {
      return;
    }
    _formkey.currentState!.save();
    Provider.of<ProductsProvider>(context, listen: false).addProducts(_product);
    Navigator.of(context).pop();
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'add a title for your product';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'add a price for your product';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }

                    if (double.parse(value) <= 0) {
                      return 'Please enter a value greater than 0';
                    }

                    return null;
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'add a descroption for your product';
                    }
                    return null;
                  },
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'add an image url for your product';
                          }
                          return null;
                        },
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
