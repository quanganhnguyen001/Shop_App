import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_project/module/cart/page/cart_page.dart';
import 'package:shop_app_project/module/home/widget/badge.dart';
import 'package:shop_app_project/providers/cart.dart';
import 'package:shop_app_project/providers/products_provider.dart';
import '../widget/product_grid.dart';

enum FilterOptions{
  Favourites,
  All,
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  var _showOnlyFavourites = false;
  @override
  Widget build(BuildContext context) {
    // final productsContainer = Provider.of<Products>(context,listen: false);// k thay doi data thi de listen fals
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
             setState(() {
                if(selectedValue == FilterOptions.Favourites){
                _showOnlyFavourites = true;
              }else{
                _showOnlyFavourites = false;
              }
             });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) =>
              [
                PopupMenuItem(child: Text('Only Favourites'),value: FilterOptions.Favourites,),
                PopupMenuItem(child: Text('Show All'),value: FilterOptions.All,),
              ]
          ),
          Consumer<Cart>(
            builder: (context, cart, child) {
              return Badge(
              child: IconButton(icon: Icon(Icons.shopping_cart),onPressed: () {
                Navigator.of(context).pushNamed(CartPage.routeName);
              },),
              value: cart.itemCount.toString(),
              color: Theme.of(context).colorScheme.secondary,
              );
            },
          ),
        ],
        title: Text('My Shop'),
      ),
      body: ProductGrid(showFav: _showOnlyFavourites,),
    );
  }
}

