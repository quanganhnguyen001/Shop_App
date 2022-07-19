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
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(loadedProduct.imageUrl,fit: BoxFit.cover,),
          ),
          SizedBox(height: 10,),
          Text('\$${loadedProduct.price}',style: TextStyle(color: Colors.grey,fontSize: 20),),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(loadedProduct.description,textAlign: TextAlign.center,softWrap: true,)
          ),
        ],
      ),
    );
  }
}