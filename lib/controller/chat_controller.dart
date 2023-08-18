import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/controller/home_controller.dart';

import '../consts/consts.dart';

class ChatController extends GetxController {
@override
  void onInit() {
    // TODO: implement onInit
    getChatId();
    super.onInit();
  }


  var chat =firestore.collection(chatsCollection);
  var friendName=Get.arguments[0];
  var friendId=Get.arguments[1];
  var senderName=Get.find<HomeController>().userName;
  var currentId=currentUser!.uid;
  var messageController=TextEditingController();
  dynamic chatDocId;
  var isLoading=false.obs;
  


  getChatId()async{
    isLoading(true);
    await chat.where('users',isEqualTo: {
      friendId:null,
      currentId:null,
    }).limit(1).get().then((QuerySnapshot snapshot){
      if(snapshot.docs.isNotEmpty){
        chatDocId=snapshot.docs.single.id;
        log(chatDocId);
      }else{
        chat.add(
          {
          'created_on':null,
          'last_msg':'',
          'user':{friendId:null,currentId:null},
          'toId':friendId,
          'fromId':currentId,
          'friendName':friendName,
          'senderName':senderName,
           }
        ).then((value) => {
          chatDocId=value.id,
        });
      }
    });
    isLoading(false);
  }





  //send messages

  sendMsg(String msg)async{
  if(msg.trim().isNotEmpty){
    chat.doc(chatDocId).update({
      'created_on':FieldValue.serverTimestamp(),
      'last_msg':msg,
      'toId':friendId,
      'fromId':currentId,
    });
    chat.doc(chatDocId).collection(messagesCollection).doc().set({
      'created_on':FieldValue.serverTimestamp(),
      'msg':msg,
      'uid':currentId

    });
  }
  }
}