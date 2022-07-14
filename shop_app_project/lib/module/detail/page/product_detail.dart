import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_project/providers/products_provider.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({ Key? key,}) : super(key: key);

static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)?.settings.arguments as String; // is the id
    final loadedProduct = Provider.of<Products>(context,listen: false).findByID(productID);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}