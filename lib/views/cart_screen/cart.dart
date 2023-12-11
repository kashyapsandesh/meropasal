import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/controller/cart_controller.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/views/cart_screen/shipping_screen.dart';

import '../../consts/consts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
      bottomNavigationBar: SizedBox(
        width: context.width - 60,
        child: customButton(
          color: redColor,
          onPress: () {
            Get.to(() => ShippingDetails());
          },
          textcolor: whiteColor,
          title: "Proceed to shipping",
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: redColor,
        automaticallyImplyLeading: false,
        title: "Shopping Cart".text.fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getCart(
            currentUser!.uid), // Replace with your actual stream

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // print(currentUser!.uid.toString());
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }
          if (!snapshot.hasData) {
            print(snapshot.data);
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var data = snapshot.data!.docs;
            controller.calculate(data);
            controller.productSnapShot = data;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Image.network(
                                '${data[index]['img']}',
                                width: 120,
                              ),
                              title: Text(
                                  '${data[index]['title']} x${data[index]['qty']}'),
                              subtitle: Text('${data[index]['tprice']}'),
                              trailing: Icon(
                                Icons.delete,
                                color: redColor,
                              ).onTap(() {
                                FirestoreServices.deleteDoc(data[index].id);
                              }),
                            );
                          }),
                    ),
                  ),
                  Row(
                    children: [
                      "Total Price"
                          .text
                          .size(18)
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make(),
                      Obx(
                        () => "${controller.totalP}"
                            .numCurrency
                            .text
                            .size(18)
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                      ),
                      60.heightBox
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
