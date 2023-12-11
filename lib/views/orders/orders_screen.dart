import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/loading_indicator.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/views/orders/order_details_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "My Orders".text.fontFamily(semibold).color(Colors.black).make(),
      ),
      // body: StreamBuilder(
      //     stream: FirestoreServices.getallOrder(),
      //     builder:
      //         (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //       if (!snapshot.hasData) {
      //         return loadingIndicator();
      //       } else if (snapshot.data!.docs.isEmpty) {
      //         return Center(
      //           child: Text("No Orders Yet"),
      //         );
      //       } else {
      //         var data = snapshot.data!.docs;
      //         log(data.toString());
      //         return ListView.builder(
      //             itemCount: data.length,
      //             itemBuilder: ((BuildContext context, int index) {
      //               return ListTile(
      //                 title: data[index]['order_code'].toString().text.make(),
      //                 subtitle:
      //                     data[index]['total_amount'].toString().text.make(),
      //               );
      //             }));
      //       }
      //     }),
      body: StreamBuilder(
        stream: FirestoreServices.getallOrder(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return loadingIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text("No Orders Yet"),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Error: ${snapshot.error}"),
                  Text("Stack Trace: ${snapshot.stackTrace}"),
                ],
              ),
            );
          } else {
            var data = snapshot.data!.docs;
            print(data.length);
            return Container(
              height: double.infinity,
              child: Expanded(
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: ((BuildContext context, index) {
                      print(
                          "Order Code: ${data[index]['order_code']}, Total Amount: ${data[index]['total_amount']}");

                      return ListTile(
                        onTap: () {
                          Get.to(() => OrderDetails(
                                data: data[index],
                              ));
                        },
                        leading: Text("${index + 1}"),
                        title: (data[index]['order_code'] ?? 'Ma')
                            .toString()
                            .text
                            .make(),
                        subtitle: (data[index]['total_amount'] ?? 'MA')
                            .toString()
                            .text
                            .make(),
                        trailing: Icon(Icons.arrow_forward_ios),
                      );
                    })),
              ),
            );
          }
        },
      ),
    );
  }
}
