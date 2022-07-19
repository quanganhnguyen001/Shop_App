import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_project/module/detail/widget/cart_item.dart';
import 'package:shop_app_project/providers/cart.dart' show Cart;
import 'package:shop_app_project/providers/orders.dart';

class CartPage extends StatelessWidget {
  const CartPage({ Key? key }) : super(key: key);

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total',style: TextStyle(fontSize: 20),),
                  Spacer(),
                  Chip(
                    backgroundColor: Colors.purple,
                    label: Text('\$${cart.totalAmount}',style: TextStyle(color: Colors.white,),)
                  ),
                  TextButton(
                    onPressed: (){
                      Provider.of<Orders>(context,listen: false).addOrder(cart.items.values.toList(), cart.totalAmount);
                      cart.clearOrder();
                    }, 
                    child: Text('ORDER NOW'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (BuildContext context, int index) {  
              return CartItem(
                id: cart.items.values.toList()[index].id,
                title: cart.items.values.toList()[index].title,
                price: cart.items.values.toList()[index].price,
                quantity: cart.items.values.toList()[index].quanity,
                productId: cart.items.keys.toList()[index],
              );
            },

          ),
          ),
        ],
      ),
    );
  }
}