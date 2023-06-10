import '../../consts/consts.dart';
import '../../controller/auth_controller.dart';
import '../home_screen/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());
  // text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var passwordRetypeController = TextEditingController();

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
              Obx(
                () => Column(
                  children: [
                    customTextField(
                        hintText: nameHint,
                        title: name,
                        controller: nameController,
                        isPass: false),
                    customTextField(
                        hintText: emailHint,
                        title: email,
                        controller: emailController,
                        isPass: false),
                    customTextField(
                        hintText: passwordHint,
                        title: password,
                        controller: passwordController,
                        isPass: true),
                    customTextField(
                        hintText: retypePasswordHint,
                        title: retypePassword,
                        controller: passwordRetypeController,
                        isPass: true),
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
                            value: isCheck,
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
                    controller.isLoading.value
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : customButton(
                                title: signup,
                                onPress: () async {
                                  if (isCheck != false) {
                                    controller.isLoading(true);
                                    try {
                                      await controller
                                          .signUpMethod(
                                              context: context,
                                              email: emailController.text,
                                              password: passwordController.text)
                                          .then((value) {
                                        return controller.storeUserData(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            name: nameController.text);
                                      }).then((value) {
                                        VxToast.show(context, msg: loggedin);
                                        Get.offAll(const HomeScreen());
                                      });
                                    } catch (e) {
                                      auth.signOut();
                                      VxToast.show(context, msg: e.toString());
                                      controller.isLoading(false);
                                    }
                                  }
                                },
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
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
