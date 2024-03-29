import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../consts/consts.dart';

class AuthController extends GetxController {
  // loading
  var isLoading = false.obs;
  // text controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  // login Method
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // signup Method
  Future<UserCredential?> signUpMethod({email, password, context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // store data method
  storeUserData({name, password, email}) async {
    DocumentReference store =
        firestore.collection(usersCollection).doc(currentUser!.uid);
    log(currentUser!.uid.toString());
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': ' ',
      'id': currentUser?.uid,
      'cart_count': "00",
      'order_count': "00",
      'wishlist_count': "00"
    });
  }

  // signout Method
  signoutMethod(context) async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  
}
