import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import '../consts/consts.dart';
import '../models/category_model.dart';

class ProductController extends GetxController {
// create a function to used json
  var subcat = [];
  RxBool isFav = false.obs;
  var quantity = 0.obs;
  RxInt colorIndex = 0.obs;
  var totalPrice = 0.obs;
  getSubCategories(title) async {
    log(title);
    subcat.clear();

    var data = await rootBundle.loadString("lib/services/category_model.json");
    // log(data.toString());
    var decoded = categoryModelFromJson(data);
    // log(decoded.toString());
    var s =
        decoded.categories.where((element) => element.name == title).toList();

    // log("sandesh${s.toString()}");
    for (var e in s[0].subcategory) {
      subcat.add(e);
    }
  }

  changeColor(index) {
    colorIndex.value = index;
  }

  increseQuantity(totalQuantity) {
    if (quantity.value < totalQuantity) {
      quantity.value++;
    }
  }

  decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  calculateTotalPrice(price) {
    totalPrice.value = price * quantity.value;
  }

  addToCart({title, img, sellername, color, qty, tprice, context}) async {
    await firestore.collection(cartCollection).doc().set({
      'title': title,
      'img': img,
      'sellername': sellername,
      'color': color,
      'qty': qty,
      'tprice': tprice,
      'added_by': currentUser!.uid,
    }).catchError((error) {
      VxToast.show(context, msg: error.toString());
    });
  }

  resetValues() {
    totalPrice.value = 0;
    quantity.value = 0;
    colorIndex.value = 0;
  }

  addToWishlist(docId, context) async {
    await firestore.collection(productsCollection).doc(docId).set({
      'p_wishlist': FieldValue.arrayUnion([currentUser!.uid])
    }, SetOptions(merge: true));
    isFav(true);
    VxToast.show(context, msg: "Added From wishlist");
  }

  removeFromWishlist(docId, context) async {
    await firestore.collection(productsCollection).doc(docId).set({
      'p_wishlist': FieldValue.arrayRemove([currentUser!.uid])
    }, SetOptions(merge: true));
    isFav(false);
    VxToast.show(context, msg: "Remove From wishlist");
  }

  Future<bool> checkIfFav(data) async {
    if (data['p_wishlist'].contains(currentUser!.uid)) {
      return isFav(true);
    } else {
      return isFav(false);
    }
  }
}
