import '../../consts/consts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;

  @override
  Widget build(BuildContext context) {
    return bgColor(Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              //Adjust according to devices;
              (context.screenHeight * 0.1).heightBox,
              appLogoIcon(),
              5.heightBox,
              'Log in to $appname'
                  .text
                  .fontFamily(regular)
                  .size(20)
                  .white
                  .make(),
              5.heightBox,
              Column(
                children: [
                  customTextField(hintText: nameHint, title: name),
                  customTextField(hintText: emailHint, title: email),
                  customTextField(hintText: passwordHint, title: password),
                  customTextField(
                      hintText: retypePasswordHint, title: retypePassword),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetPassword.text.make(),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: redColor,
                          value: this.isCheck,
                          onChanged: (newValue) {
                            setState(() {
                              isCheck = newValue;
                            });
                          }),
                      5.widthBox,
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'I agree to the',
                                style: TextStyle(
                                  fontFamily: bold,
                                  color: fontGrey,
                                ),
                              ),
                              TextSpan(
                                text: termAndCondition,
                                style: TextStyle(
                                  fontFamily: bold,
                                  color: redColor,
                                ),
                              ),
                              TextSpan(
                                text: privacyPolicy,
                                style: TextStyle(
                                  fontFamily: bold,
                                  color: redColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  customButton(
                          title: signup,
                          onPress: () {},
                          color: isCheck == true ? redColor : fontGrey)
                      .box
                      .width(context.screenWidth - 50)
                      .make(),
                  5.heightBox,
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: haveAnAccount,
                          style: TextStyle(fontFamily: bold, color: fontGrey),
                        ),
                        TextSpan(
                          text: login,
                          style: TextStyle(fontFamily: bold, color: redColor),
                        ),
                      ],
                    ),
                  ).onTap(() {
                    Get.back();
                  }),
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 72)
                  .make(),
            ],
          ),
        ),
      ),
    ));
  }
}
