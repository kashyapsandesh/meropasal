import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;

import '../consts/consts.dart';

class ProfileController extends GetxController {
  var profileImgPath = ''.obs;
  // is loading
  var isLoading = false.obs;
  // profile imagelink path
  var profileImgLink = ' ';
  // textfield
  var nameController = TextEditingController();
  var oldpassController = TextEditingController();
  var newpassController = TextEditingController();
  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileImgPath.value = img.path;
    } on VxPlatform catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  // uploading profile image to storage
  uploadProfileImage() async {
    var filename = p.basename(profileImgPath.value);
    var destination = 'images/${currentUser!.uid}/$filename';
    Reference ref =  FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImgPath.value));
    profileImgLink = await ref.getDownloadURL();
    
  }

  // update profile
  updateProfile({name, password, imgUrl}) async {
    var store = firestore.collection(usersCollection).doc(currentUser!.uid);
    await store.set({
      'name': name,
      'password': password,
      'imageUrl': imgUrl,
    }, SetOptions(merge: true));
    isLoading(false);
  }

  // change Auth pass with update
  changeAuthPassword({email, password, newPassword}) async {
    final cred = EmailAuthProvider.credential(email: email, password: password);
    await currentUser!.reauthenticateWithCredential(cred).then((value) {
      currentUser!.updatePassword(newPassword);
    }).catchError((error) {});
  }
}
