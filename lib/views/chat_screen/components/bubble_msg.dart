import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../consts/consts.dart';

Widget senderBubble(DocumentSnapshot data){
  return Container(
    padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                      color: redColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                    ),
                    
                    
                  ),
                  child: Column(
                    children: [
                      "${data['msg']}".text.white.make(),
                      10.heightBox,
                      "11:45 pm".text.white.make()
                    ],
                  ),
                );

}