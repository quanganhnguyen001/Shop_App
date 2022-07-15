import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_project/module/detail/page/product_detail.dart';
import 'package:shop_app_project/providers/product.dart';

class ProductItem extends StatelessWidget {
  // const ProductItem({ Key? key, required this.title, required this.id, required this.imageUrl }) : super(key: key);

  // final String title;
  // final String id;
  // final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(ProductDetail.routeName, arguments: product.id,);
        },
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            leading: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: (){},
            ),
            trailing: IconButton(
              color: Theme.of(context).colorScheme.secondary,
              icon: Icon(product.isFavourites ? Icons.favorite : Icons.favorite_border),
              onPressed: (){
                product.toggleFavourites();
              },
            ),
            backgroundColor: Colors.black87,
            title: Text(product.title,
            textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}