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

  addToCart({title, img, sellername, color, qty, tprice, context}) async {
    await firestore.collection(cartCollection).doc().set({
      "title": title,
      "img": img,
      "sellername": sellername,
      "color": color,
      "qty": qty,
      "tprice": tprice,
      "added by": currentUser!.uid
    }).catchError((error) {
      VxToast.show(context, msg: error.toString());
    });
  }

  resetValues() {
    totalPrice.value = 0;
    quantity.value = 0;
    colorIndex.value = 0;
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
