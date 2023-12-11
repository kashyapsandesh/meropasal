import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/orders/components/order_status.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  final dynamic data;
  const OrderDetails({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: 'Order Details'.text.fontFamily(semibold).make(),
      ),
      body: Column(
        children: [
          orderStatus(
            icon: Icons.done,
            color: redColor,
            title: 'Order Placed',
            showDone: data['order_placed'] ?? false,
          ),
        ],
      ),
    );
  }
}
