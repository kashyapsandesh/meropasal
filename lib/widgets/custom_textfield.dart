import '../consts/consts.dart';

Widget customTextField({String? title, String? hintText, controller}) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title!.text.fontWeight(FontWeight.bold).color(redColor).size(20).make(),
        5.heightBox,
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontFamily: semibold,
                color: textfieldGrey,
              ),
              isDense: true,
              fillColor: lightGrey,
              filled: true,
              border: InputBorder.none,
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: redColor))),
        ),
        10.heightBox,
      ],
    ),
  );
}
