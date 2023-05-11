import 'dart:io';

import '../../../consts/consts.dart';
import '../../../controller/profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return bgColor(Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            controller.profileImgPath.isEmpty
                ? Image.asset(
                    imgProfile2,
                    width: 90,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()
                : Image.file(
                    File(controller.profileImgPath.value),
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            customButton(
              color: redColor,
              onPress: () {
                Get.find<ProfileController>().changeImage(context);
              },
              textcolor: whiteColor,
              title: "Change",
            ),
            Divider(),
            20.heightBox,
            customTextField(
              hintText: nameHint,
              title: name,
              isPass: false,
            ),
            customTextField(
              hintText: passwordHint,
              title: password,
              isPass: true,
            ),
            20.heightBox,
            customButton(
              color: redColor,
              onPress: () {},
              textcolor: whiteColor,
              title: "Save",
            ),
          ],
        )
            .box
            .white
            .shadowSm
            .rounded
            .padding(EdgeInsets.all(16))
            .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
            .make(),
      ),
    ));
  }
}
