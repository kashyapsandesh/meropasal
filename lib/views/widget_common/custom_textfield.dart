import '../../consts/consts.dart';

Widget customTextField(
    {String? title, String? hintText, controller, bool? isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.fontWeight(FontWeight.bold).color(redColor).size(20).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass!,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontFamily: semibold,
              color: textfieldGrey,
            ),
            isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder:
                const OutlineInputBorder(borderSide: BorderSide(color: redColor))),
      ),
      10.heightBox,
    ],
  );
}
