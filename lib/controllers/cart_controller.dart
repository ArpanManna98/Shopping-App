import 'package:eshop/consts/consts.dart';

class CartController extends GetxController {
  var totalPrice = 0.obs;

  // Cart's Total Price calculation
  TotalpriceCalculation(data) {
    totalPrice.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalPrice.value = totalPrice.value + int.parse(data[i]["tprice"].toString());
    }
  }
}
