import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_project/module/home/widget/app_drawer.dart';
import 'package:shop_app_project/module/order/widget/order_item.dart';
import 'package:shop_app_project/providers/orders.dart' show Orders;

class OrderPage extends StatelessWidget {
  const OrderPage({ Key? key }) : super(key: key);

  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, index){
          return OrderItem(
            order: orderData.orders[index]
          );
        },
      ),
    );
  }
}