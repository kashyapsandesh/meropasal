import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/orders/components/order_placed_details.dart';
import 'package:emart_app/views/orders/components/order_status.dart';
import 'package:intl/intl.dart' as intl;

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            orderStatus(
              icon: Icons.done,
              color: redColor,
              title: ' Placed',
              showDone: data['order_placed'] ?? false,
            ),
            orderStatus(
              icon: Icons.thumb_up,
              color: Colors.blue,
              title: ' Confirmed',
              showDone: data['order_confirmed'] ?? false,
            ),
            orderStatus(
              icon: Icons.car_repair_rounded,
              color: Colors.yellow,
              title: 'On Delivery',
              showDone: data['order_on_delivery'] ?? false,
            ),
            orderStatus(
              icon: Icons.done_all_rounded,
              color: Colors.purple,
              title: 'Delivered',
              showDone: data['order_delivered'] ?? false,
            ),
            Divider(),
            10.heightBox,
            orderPlacedDetails(
              t1: "Order Code",
              t2: data['order_code'],
              d1: 'Shipping Method ',
              d2: data['shipping_method'],
            ),
            5.heightBox,
            orderPlacedDetails(
              t1: "Order Date",
              t2: intl.DateFormat("h:mma")
                  .format((data['order_date'].toDate())),
              d1: 'Payment Method ',
              d2: data['payment_method'],
            ),
          ],
        ),
      ),
    );
  }
}
