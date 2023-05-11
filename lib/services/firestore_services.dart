import '../consts/consts.dart';

class FirestoreServices {
  static getUser(uid) {
    // get users data
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}
