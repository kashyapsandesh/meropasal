import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/category_model.dart';

class ProductController extends GetxController {
// create a function to used json
  var subcat = [];
  var quantity = 0.obs;
  var colorIndex = 0.obs;
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
      print(e);
    }
  }

  changeColor(index) {
    colorIndex = index;
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
    totalPrice.value=price * quantity.value;
  }
}
