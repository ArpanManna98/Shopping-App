import 'package:eshop/consts/consts.dart';
import 'package:eshop/models/category_model.dart';
import 'package:flutter/services.dart';

class ProductController extends GetxController {
  var subcat = [];
  var quantity = 0.obs;
  var colorIndex = 0.obs;
  var totalPrice = 0.obs;

  calculationTotalPrice(price) {
    totalPrice.value = price * quantity.value;
  }

  changeColorIndex(index) {
    colorIndex.value = index;
  }

  increaseQunatity(totalQuantity) {
    if (quantity.value < totalQuantity) {
      quantity.value = quantity.value + 1;
    }
  }

  decreaseQunatity() {
    if (quantity.value > 0) {
      quantity.value = quantity.value - 1;
    }
  }

  getSubCategories(title) async {
    subcat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s =
        decoded.categories.where((element) => element.name == title).toList();
    for (var e in s[0].subcategory) {
      subcat.add(e);
    }
  }
}
