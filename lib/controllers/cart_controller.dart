import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/consts/consts.dart';
import 'package:eshop/controllers/home_controller.dart';

class CartController extends GetxController {
  var totalPrice = 0.obs;
  var paymentIndex = 0.obs;
  late dynamic productSnapshot;
  var products = [];

// ShippingScreen textfield's Controllers
  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var pincodeController = TextEditingController();
  var phoneController = TextEditingController();

  // Cart's Total Price calculation
  TotalpriceCalculation(data) {
    totalPrice.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalPrice.value =
          totalPrice.value + int.parse(data[i]["tprice"].toString());
    }
  }

  // PaymentChckbox change method
  changePaymentIndex(index) {
    paymentIndex.value = index;
  }

//Order create methods
  placeMyOrder({required orderPaymentMethod, required totalAmount}) async {
    await getProductDetails();
    await firestore.collection(ordersCollection).doc().set({
      "order_code":"642554373",
      "order_date":FieldValue.serverTimestamp(),
      "order_by":currentUser!.uid,
      "order_by_name":Get.find<HomeController>().username,
      "order_by_email":currentUser!.email,
      "order_by_address":addressController.text,
      "order_by_state":stateController.text,
      "order_by_city":cityController.text,
      "order_by_phone":phoneController.text,
      "order_by_pincode":pincodeController.text,
      "shipping_method":"Home Delivery",
      "payment_method":orderPaymentMethod,
      "order_placed":true,
      "order_confirmed":false,
      "order_delivered": false,
      "total_amount":totalAmount,
      "orders":FieldValue.arrayUnion(products)
    });
  }

  // Get product details method
  getProductDetails() {
    products.clear();
    for (var i = 0; i < productSnapshot.length; i++) {
      products.add({
        "color": productSnapshot[i]["color"],
        "img": productSnapshot[i]["img"],
        "qty": productSnapshot[i]["title"]
      });
    }
  }
}
