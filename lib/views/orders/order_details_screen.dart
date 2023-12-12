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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Expanded(
                  child: Card(
                shadowColor: Colors.black,
                child: Padding(
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
                    ],
                  ),
                ),
              )).box.roundedFull.make(),
              10.heightBox,
              Expanded(
                  child: Card(
                shadowColor: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      orderPlacedDetails(
                        t1: "Order Code",
                        t2: data['order_code'],
                        d1: 'Shipping Method ',
                        d2: data['shipping_method'],
                      ),
                      5.heightBox,
                      orderPlacedDetails(
                        t1: "Order Date",
                        t2: intl.DateFormat()
                            .add_yMd()
                            .format((data['order_date'].toDate())),
                        d1: 'Payment Method ',
                        d2: data['payment_method'],
                      ),
                      5.heightBox,
                      orderPlacedDetails(
                        t1: "Payment status",
                        t2: 'Unpaid',
                        d1: 'Ordered Placed ',
                        d2: data['payment_method'],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Shipping Address"
                                    .text
                                    .fontFamily(semibold)
                                    .size(18)
                                    .color(Colors.black)
                                    .make(),
                                "Name: ${data['order_by_name']}"
                                    .text
                                    .fontFamily(semibold)
                                    .make(),
                                "Email: ${data['order_by_email']}"
                                    .text
                                    .fontFamily(semibold)
                                    .make(),
                                "Address: ${data['order_by_address']}"
                                    .text
                                    .fontFamily(semibold)
                                    .make(),
                                "City: ${data['order_by_city']}"
                                    .text
                                    .fontFamily(semibold)
                                    .make(),
                                "State: ${data['order_by_state']}"
                                    .text
                                    .fontFamily(semibold)
                                    .make(),
                                "Phone: ${data['order_by_phone']}"
                                    .text
                                    .fontFamily(semibold)
                                    .make(),
                              ],
                            ),
                            Column(
                              children: [
                                "Total Amount"
                                    .text
                                    .size(16)
                                    .color(redColor)
                                    .fontFamily(semibold)
                                    .make(),
                                " ${data['total_amount']}"
                                    .text
                                    .fontFamily(semibold)
                                    .make(),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )).box.white.roundedFull.make(),
              Divider(),
              10.heightBox,
              "Ordered Products"
                  .text
                  .fontFamily(semibold)
                  .size(18)
                  .color(Colors.black)
                  .make(),
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(data['orders'].length, (index) {
                  return Column(
                    children: [
                      orderPlacedDetails(
                          t1: data['orders'][index]['title'],
                          t2: data['orders'][index]['tprice'],
                          d1: data['orders'][index]['title'],
                          d2: data['orders'][index]['title']),
                      Container(
                        width: 20,
                        height: 20,
                        color: Color(data['orders'][index]['color']),
                      )
                    ],
                  );
                }).toList(),
              ).box.outerShadowMd.white.make(),
              Divider(),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Sub Total:".text.size(16).fontFamily(semibold).make(),
                    "Phone: ${data['order_by_phone']}"
                        .text
                        .fontFamily(semibold)
                        .make(),
                    Text("Hello")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
