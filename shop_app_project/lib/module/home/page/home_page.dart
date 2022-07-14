import 'package:flutter/material.dart';
import 'package:shop_app_project/models/product.dart';
import 'package:shop_app_project/module/home/widget/product_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 /2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context,index){
          return ProductItem(
            title: loadedProduct[index].title,
            id: loadedProduct[index].id,
            imageUrl: loadedProduct[index].imageUrl,
          );
        },
        itemCount: loadedProduct.length,
      ),
    );
  }
}