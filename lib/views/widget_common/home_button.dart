import '../../consts/consts.dart';

Widget homeButtons(
    {String? title, double? width, double? height, icon, onPress}) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          icon,
          width: 26,
        ),
        10.heightBox,
        title!.text.fontFamily(semibold).color(darkFontGrey).make(),
      ],
    )
        .box
        .rounded
        .white
        .margin(EdgeInsets.only(top: 10))
        .size(width!, height!)
        .make(),
  );
}
