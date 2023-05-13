import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductController extends GetxController {
// create a function to used json
  getSubCategories() async {
    var data = rootBundle.loadString("lib/services/category_model.json");
  }
}
