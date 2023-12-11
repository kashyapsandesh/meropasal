
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/loading_indicator.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/views/chat_screen/components/bubble_msg.dart';

import '../../controller/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChatController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "${controller.friendName}"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: loadingIndicator(),
                    )
                  : Expanded(
                      child: StreamBuilder(
                          stream: FirestoreServices.getChatMessage(
                              controller.chatDocId.toString()),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            // print(controller.chatDocId);
                            if (!snapshot.hasData) {
                              print(snapshot.data.toString());
                              return Center(
                                child: loadingIndicator(),
                              );
                            } else if (snapshot.data!.docs.isEmpty) {
                              return Center(
                                child: "Send a Message".text.make(),
                              );
                            } else {
                              return ListView(
                                children: snapshot.data!.docs
                                    .mapIndexed((currentValue, index) {
                                  var data = snapshot.data!.docs[index];
                                  // print(data.toString());
                                  return Align(
                                      alignment: data['uid'] == currentUser!.uid
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                      child: senderBubble(data));
                                }).toList(),
                              );
                            }
                          })

                      //   StreamBuilder(
                      //   stream: FirestoreServices.getChatMessage(controller.chatDocId.toString()),
                      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      //     if (!snapshot.hasData) {
                      //       return Center(
                      //         child: loadingIndicator(),
                      //       );
                      //     } else if (snapshot.data!.docs.isEmpty) {
                      //       return Center(
                      //         child: "Send a Message".text.make(),
                      //       );
                      //     } else {
                      //       return ListView.builder(
                      //         itemCount: snapshot.data!.docs.length,
                      //         itemBuilder: (context, index) {
                      //           // Create a widget based on the data in snapshot.data!.docs[index]
                      //           return senderBubble(); // Modify this line to create the correct message bubble
                      //         },
                      //       );
                      //     }
                      //   },
                      // )

                      ),
            ),
            10.heightBox,
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: controller.messageController,
                  decoration: InputDecoration(
                    hintText: "Ask your queries",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: textfieldGrey,
                      ),
                    ),
                  ),
                )),
                IconButton(
                    onPressed: () {
                      controller.sendMsg(controller.messageController.text);
                      controller.messageController.clear();
                    },
                    icon: Icon(
                      Icons.send,
                      color: redColor,
                    ))
              ],
            )
                .box
                .height(80)
                .padding(EdgeInsets.symmetric(horizontal: 12))
                .margin(EdgeInsets.only(bottom: 8))
                .make(),
          ],
        ),
      ),
    );
  }
}
