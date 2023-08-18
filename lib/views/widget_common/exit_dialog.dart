import 'package:flutter/services.dart';

import '../../consts/colors.dart';
import '../../consts/consts.dart';

class ExitDialogBox extends StatelessWidget {
  const ExitDialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm".text.fontFamily(bold).color(darkFontGrey).size(18).make(),
        Divider(),
        10.heightBox,
        'Are you sure, you want to exit?'
            .text
            .size(16)
            .color(darkFontGrey)
            .make(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            customButton(
              color: redColor,
              onPress: () {
                SystemNavigator.pop();
              },
              title: 'Yes',
            ),
            customButton(
              color: Colors.lightGreen,
              onPress: () {
                Get.back();
              },
              title: 'Cancel',
            ),
          ],
        ),
      ],
    ).box.color(lightGrey).p24.roundedSM.make(),
  );

  }
}