import '../../../consts/consts.dart';

Widget detailsCard({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).color(darkFontGrey).make(),
      5.heightBox,
      title!.text.color(darkFontGrey).make()
    ],
  ).box.white.rounded.height(70).width(width).padding(EdgeInsets.all(6)).make();
}
