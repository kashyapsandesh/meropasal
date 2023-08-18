import '../consts/consts.dart';

class CartController extends GetxController {
  var totalP = 0.obs;
  calculate(data){
    totalP=0.obs;
    for(var i=0;i<data.length;i++){
      totalP.value=totalP.value+int.parse(data[i]['tprice'].toString());
    }
  }
}