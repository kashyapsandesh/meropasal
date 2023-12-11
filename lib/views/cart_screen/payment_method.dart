import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/loading_indicator.dart';
import 'package:emart_app/controller/cart_controller.dart';
import 'package:emart_app/views/home_screen/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Obx(
      () => Scaffold(
        bottomNavigationBar: controller.placingOrder.value
            ? Center(
                child: loadingIndicator(),
              )
            : SizedBox(
                width: context.width - 60,
                child: customButton(
                  color: redColor,
                  onPress: () async {
                    await controller.placeMyOrder(
                    
                        orderPaymentMethod:
                            paymentMethods[controller.paymentIndex.value],
                        totalAmount: controller.totalP.value);
                    await controller.clearCart();
                    VxToast.show(context, msg: "Order Placed");
                    Get.offAll(HomeScreen());
                  },
                  textcolor: whiteColor,
                  title: "Place My Order",
                ),
              ),
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: "Choose Payment Method"
              .text
              .fontFamily(semibold)
              .color(darkFontGrey)
              .make(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => Column(
              children: List.generate(
                  paymentMethodsImage.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            controller.changePaymentIndex(index);
                          },
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: redColor,
                                    width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child:
                                Stack(alignment: Alignment.topRight, children: [
                              Image.asset(
                                paymentMethodsImage[index],
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              controller.paymentIndex == index
                                  ? Checkbox(
                                      activeColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      value: true,
                                      onChanged: (Value) {})
                                  : Container()
                            ]),
                          ),
                        ),
                      )),
            ),
          ),
        ),
      ),
    );
  }
}
