import 'package:eshop/consts/consts.dart';

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

  // Get cart details
  static getCart(uid) {
    return firestore
        .collection(cartCollection)
        .where("added by", isEqualTo: uid)
        .snapshots();
  }

  // Delete cart items
  static deleteItems(docId) {
    return firestore.collection(cartCollection).doc(docId).delete();
  }

  // Get all chat messages
  static getChatMessages(docId) {
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy("created_on", descending: false)
        .snapshots();
  }

  // Get Order Details
  static getOrderDetails() {
    return firestore
        .collection(ordersCollection)
        .where("order_by", isEqualTo: currentUser!.uid)
        .snapshots();
  }

  // Get Wishlist Details
  static getWishlist() {
    return firestore
        .collection(productCollection)
        .where("p_wishlist", arrayContains: currentUser!.uid)
        .snapshots();
  }

  // Get All Messages
  static getAllMessages() {
    return firestore
        .collection(chatsCollection)
        .where("fromId",isEqualTo: currentUser!.uid)
        .snapshots();
  }
}
