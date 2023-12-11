import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/loading_indicator.dart';
import 'package:emart_app/services/firestore_services.dart';
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
              return Container();
            }
          }),
    );
  }
}
