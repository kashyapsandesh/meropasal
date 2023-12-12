import 'package:emart_app/consts/consts.dart';

Widget orderStatus({icon, color, title, showDone}) {
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ).box.border(color: color).make(),
    trailing: SizedBox(
      height: 100,
      width: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          title.toString().text.color(fontGrey).make(),
          showDone
              ? Icon(Icons.done).box.border(color: color).make()
              : Container(),
        ],
      ),
    ),
  );
}
