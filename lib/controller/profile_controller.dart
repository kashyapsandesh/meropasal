
import 'package:image_picker/image_picker.dart';

import '../consts/consts.dart';

class ProfileController extends GetxController {
  var profileImgPath = ''.obs;
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
}
