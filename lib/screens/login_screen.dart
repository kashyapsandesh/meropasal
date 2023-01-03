import '../consts/consts.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  customTextField(hintText: emailHint, title: email),
                  customTextField(hintText: passwordHint, title: password),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetPassword.text.make(),
                    ),
                  ),
                  customButton(
                      title: login,
                      onPress: () {
                        Get.to(() => HomeScreen());
                      }).box.width(context.screenWidth - 50).make(),
                  5.heightBox,
                  createNewAccount.text.color(darkFontGrey).make(),
                  5.heightBox,
                  customButton(
                      title: signup,
                      onPress: () {
                        Get.to(() => SignupScreen());
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
                                  child: Image.asset(ListIcon[index]),
                                ),
                              )))
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(EdgeInsets.all(16))
                  .width(context.screenWidth - 72)
                  .make(),
            ],
          ),
        ),
      ),
    ));
  }
}
