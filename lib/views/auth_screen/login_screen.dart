import '../../consts/consts.dart';
import '../../controller/auth_controller.dart';
import '../home_screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
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
                        hintText: emailHint,
                        title: email,
                        isPass: false,
                        controller: controller.emailController),
                    customTextField(
                        hintText: passwordHint,
                        title: password,
                        isPass: true,
                        controller: controller.passwordController),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: forgetPassword.text.make(),
                      ),
                    ),
                    controller.isLoading.value
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : customButton(
                            title: login,
                            onPress: () async {
                              controller.isLoading(true);
                              await controller
                                  .loginMethod(context: context)
                                  .then((value) {
                                if (value != null) {
                                  VxToast.show(context, msg: loggedin);
                                  Get.offAll(() => const HomeScreen());
                                } else {
                                  controller.isLoading(false);
                                }
                              });
                            }).box.width(context.screenWidth - 50).make(),
                    5.heightBox,
                    createNewAccount.text.color(darkFontGrey).make(),
                    5.heightBox,
                    customButton(
                        title: signup,
                        onPress: () {
                          Get.to(() => const SignupScreen());
                        }).box.width(context.screenWidth - 50).make(),
                    10.heightBox,
                    loginwith.text.make(),
                    10.heightBox,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            3,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: lightGrey,
                                    radius: 25,
                                    child: Image.asset(listIcon[index]),
                                  ),
                                )))
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
