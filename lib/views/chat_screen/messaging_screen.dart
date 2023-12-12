import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/loading_indicator.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/views/chat_screen/chat_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title:
            "My Messages".text.fontFamily(semibold).color(Colors.black).make(),
      ),
      body: StreamBuilder(
          stream: FirestoreServices().getMessages(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return loadingIndicator();
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text("No Messages Yet"),
              );
            } else {
              var data = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Get.to(() => ChatScreen(), arguments: [
                            data[index]['friendName'],
                            data[index]['toId']
                          ]);
                        },
                        leading: CircleAvatar(
                          backgroundColor: redColor,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        title: Text('${data[index]['friendName']}'),
                        subtitle: Text('${data[index]['last_msg']}'),
                        // trailing: Icon(
                        //   Icons.favorite,
                        //   color: redColor,
                        // ).onTap(() async {
                        //   await firestore
                        //       .collection(productsCollection)
                        //       .doc(data[index].id)
                        //       .set({
                        //     'p_wishlist':
                        //         FieldValue.arrayRemove([currentUser?.uid ?? ''])
                        //   }, SetOptions(merge: true));
                        // }),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
