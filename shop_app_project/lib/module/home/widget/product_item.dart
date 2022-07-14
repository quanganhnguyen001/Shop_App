import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({ Key? key, required this.title, required this.id, required this.imageUrl }) : super(key: key);

  final String title;
  final String id;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(
          imageUrl,
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
            icon: Icon(Icons.favorite),
            onPressed: (){},
          ),
          backgroundColor: Colors.black87,
          title: Text(title,
          textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}