import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../consts/consts.dart';

class FirestoreServices {
  static getUser(uid) {
    // get users data
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  // get products according to category
  // method complete
  static getProducts(category) {
    print(firestore
        .collection(productsCollection)
        .where('p_category', isEqualTo: category)
        .snapshots());
    return firestore
        .collection(productsCollection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }

  //get cart
  static getCart(uid) {
    print(firestore
        .collection("Cart" + cartCollection)
        .where("added_by", isEqualTo: uid)
        .snapshots());
    return firestore
        .collection(cartCollection)
        .where("added_by", isEqualTo: uid)
        .snapshots();
  }

  //delete doc
  static deleteDoc(docId) {
    return firestore.collection(cartCollection).doc(docId).delete();
  }

  //get all chart messages
  static Stream<QuerySnapshot> getChatMessage(docId) {
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy("created_on", descending: false)
        .snapshots();
  }
}
