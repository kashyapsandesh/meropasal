import '../consts/consts.dart';

Widget customButton({
  String? title,
  onPress,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        primary: redColor, padding: EdgeInsets.all(15)),
    onPressed: onPress,
    child: title!.text.fontFamily(bold).white.size(18).make(),
  );
}
