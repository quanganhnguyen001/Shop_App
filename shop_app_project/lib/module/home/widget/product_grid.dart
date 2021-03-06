import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_project/module/home/widget/product_item.dart';
import 'package:shop_app_project/providers/products_provider.dart';



class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key? key, required this.showFav,
  }) : super(key: key);

  final bool showFav;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFav ? productsData.favouritesItem : productsData.items;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 /2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context,index){
        return ChangeNotifierProvider.value(
          value: products[index],// tra ve 1 product
          child: ProductItem(
          // title: products[index].title,
          // id: products[index].id,
          // imageUrl: products[index].imageUrl,
          ),
        );
      },
      itemCount: products.length,
    );
  }
}