import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';

import '../../../consts/consts.dart';

Widget senderBubble(DocumentSnapshot data){

  var t = data['created_on'] == null? DateTime.now(): data['created_on'].toDate();
var time = DateFormat("h:mma").format(t);
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
                 time.text.white.make()
                    ],
                  ),
                );

}