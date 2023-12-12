import 'package:emart_app/consts/consts.dart';

Widget orderPlacedDetails(
    {required t1, required t2, required d1, required d2}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "$t1".text.fontFamily(semibold).color(redColor).make(),
          "$t2".text.fontFamily(semibold).color(redColor).make(),
        ],
      ),
      Column(
        children: [
          "$d1".text.fontFamily(semibold).make(),
          "$d2".text.fontFamily(semibold).make(),
        ],
      )
    ],
  );
}
