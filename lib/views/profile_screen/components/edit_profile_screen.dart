import 'dart:io';

import '../../../consts/consts.dart';
import '../../../controller/profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;

  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgColor(Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // if data image url and controller is empty
            data['imageUrl'] == " " && controller.profileImgPath.isEmpty
                ? Image.asset(
                    imgProfile2,
                    width: 90,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()
                // if data is not empty but controller path is empty
                : data['imageUrl'] != " " && controller.profileImgPath.isEmpty
                    ? Image.network(
                        data['imageUrl'],
                        width: 90,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    // if both are empty
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
              controller: controller.nameController,
              hintText: nameHint,
              title: name,
              isPass: false,
            ),
            customTextField(
              controller: controller.passController,
              hintText: passwordHint,
              title: password,
              isPass: true,
            ),
            20.heightBox,
            controller.isLoading.value
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  )
                : SizedBox(
                    width: context.screenWidth - 60,
                    child: customButton(
                      color: redColor,
                      onPress: () async {
                        controller.isLoading(true);
                        await controller.uploadProfileImage();
                        await controller.updateProfile(
                          imgUrl: controller.profileImgLink,
                          name: controller.nameController.text,
                          password: controller.passController.text,
                        );

                        VxToast.show(context, msg: "Updated");
                      },
                      textcolor: whiteColor,
                      title: "Save",
                    ),
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
