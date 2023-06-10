import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../consts/consts.dart';
// ignore: unnecessary_import
import 'package:velocity_x/velocity_x.dart';

import '../../consts/loading_indicator.dart';
import '../../controller/product_controller.dart';
import '../../services/firestore_services.dart';
import 'item_details.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    log(controller.subcat.length.toString());
    return bgColor(Scaffold(
      appBar: AppBar(
        title: title?.text.white.fontFamily(bold).make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getProducts(title),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: "No products found".text.color(darkFontGrey).make(),
            );
          } else {
            var data = snapshot.data!.docs;
            return Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(
                            controller.subcat.length,
                            (index) => "${controller.subcat[index]}"
                                .text
                                .size(12)
                                .color(fontGrey)
                                .fontFamily(semibold)
                                .makeCentered()
                                .box
                                .white
                                .rounded
                                .size(120, 60)
                                .margin(const EdgeInsets.symmetric(horizontal: 4))
                                .make())),
                  ),
                  10.heightBox,
                  // items container
                  Expanded(
                    child: Container(
                      color: lightGrey,
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, mainAxisExtent: 250),
                          itemCount: data.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(data[index]['p_imgs'][0],
                                    height: 150, width: 300, fit: BoxFit.fill),
                                5.heightBox,
                                "${data[index]['p_name']}"
                                    .text
                                    .fontFamily(semibold)
                                    .makeCentered(),
                                5.heightBox,
                                "${data[index]['p_price']}"
                                    .numCurrency
                                    .text
                                    .size(18)
                                    .fontFamily(bold)
                                    .color(redColor)
                                    .make(),
                              ],
                            )
                                .box
                                .rounded
                                .white
                                .outerShadowSm
                                .margin(const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10))
                                .make()
                                .onTap(() {
                              Get.to(() => ItemDetails(
                                  title: "${data[index]['p_name']}",
                                  data: data[index]));
                            });
                          })),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    ));
  }
}
