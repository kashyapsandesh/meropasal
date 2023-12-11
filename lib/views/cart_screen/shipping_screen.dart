import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controller/cart_controller.dart';
import 'package:emart_app/views/cart_screen/payment_method.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ShippingDetails extends StatefulWidget {
  const ShippingDetails({Key? key}) : super(key: key);

  @override
  State<ShippingDetails> createState() => _ShippingDetailsState();
}

class _ShippingDetailsState extends State<ShippingDetails> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      bottomNavigationBar: SizedBox(
        width: context.width - 60,
        child: customButton(
          color: redColor,
          onPress: () {
            if (controller.addressController.text.length > 10) {
              Get.to(() => PaymentMethods());
            }
            {
              VxToast.show(context, msg: "please fill the form");
            }
          },
          textcolor: whiteColor,
          title: "Continue",
        ),
      ),
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Shipping Info"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          customTextField(
              hintText: "Address",
              isPass: false,
              title: "Address",
              controller: controller.addressController),
          customTextField(
              hintText: "city",
              isPass: false,
              title: "city",
              controller: controller.cityController),
          customTextField(
              hintText: "state",
              isPass: false,
              title: "state",
              controller: controller.stateController),
          customTextField(
              hintText: "postal code",
              isPass: false,
              title: "Postal code",
              controller: controller.postalcodeController),
          customTextField(
              hintText: "phone",
              isPass: false,
              title: "Phone No",
              controller: controller.phoneController),
        ]),
      ),
    );
  }
}
