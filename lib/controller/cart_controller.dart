import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/controller/home_controller.dart';

import '../consts/consts.dart';

class CartController extends GetxController {
  var totalP = 0.obs;

  //controller for shipping details;
  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var postalcodeController = TextEditingController();
  var phoneController = TextEditingController();
  var products = [];
  var placingOrder = false.obs;

  var paymentIndex = 0.obs;
  late dynamic productSnapShot;

  calculate(data) {
    totalP = 0.obs;
    for (var i = 0; i < data.length; i++) {
      totalP.value = totalP.value + int.parse(data[i]['tprice'].toString());
    }
  }

  changePaymentIndex(index) {
    paymentIndex.value = index;
  }

  placeMyOrder({required orderPaymentMethod, required totalAmount}) async {
    print("Thik xa");
    placingOrder(true);
    await getProductDetails();
    await firestore.collection(ordersCollection).doc().set({
      'order_by': currentUser!.uid,
      'order_by_name': Get.find<HomeController>().userName,
      'order_by_email': currentUser!.email,
      'order_by_address': addressController.text,
      'order_by_state': stateController.text,
      'order_by_city': cityController.text,
      'order_by_phone': phoneController.text,
      'order_by_postal_code': postalcodeController.text,
      'shipping_method': 'Home Delivery',
      'payment_method': orderPaymentMethod,
      'order_placed': true,
      'order_date': DateTime.now(),
      'order_confirmed': false,
      'order_delivered': false,
      'order_code': '64654646',
      'order_on_delivery': false,
      'total_amount': totalAmount,
      'orders': FieldValue.arrayUnion(products),
    });
    placingOrder(false);
  }

  getProductDetails() {
    for (var i = 0; i < productSnapShot.length; i++) {
      products.add({
        'color': productSnapShot[i]['color'],
        'img': productSnapShot[i]['img'],
        'vendor_id': productSnapShot[i]['vendor_id'],
        'tprice': productSnapShot[i]['tprice'],
        'qty': productSnapShot[i]['qty'],
        'title': productSnapShot[i]['title'],
      });
    }
  }

  clearCart() {
    for (var i = 0; i < productSnapShot.length; i++) {
      firestore.collection(cartCollection).doc(productSnapShot[i].id).delete();
    }
  }
}
