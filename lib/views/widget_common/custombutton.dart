import '../../consts/consts.dart';

Widget customButton({String? title, onPress, color, textcolor}) {
  return ElevatedButton(
    style:
        ElevatedButton.styleFrom(primary: color, padding: EdgeInsets.all(15)),
    onPressed: onPress,
    child: title!.text.fontFamily(bold).color(textcolor).size(18).make(),
  );
}
