import 'package:eshop/consts/consts.dart';
import 'package:eshop/models/category_model.dart';

class FirestoresServices {
  // Get user data from firestore
  static getUser(uid) {
    return firestore
        .collection(userCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

// Get product details by category
  static getProducts(category) {
    return firestore
        .collection(productCollection)
        .where("p_category", isEqualTo: category)
        .snapshots();
  }
}
