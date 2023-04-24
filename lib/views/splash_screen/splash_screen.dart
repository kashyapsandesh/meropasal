import '../../consts/consts.dart';
import '../widget_common/applogo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Future.delayed(Duration(seconds: 10), () {
      Get.to(() => LoginScreen());
    });
  }

  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              icSplashBg,
              width: 300,
            ),
          ),
          appLogoIcon(),
          10.heightBox,
          appname.text.fontFamily(bold).size(22).white.make(),
          20.heightBox,
          appversion.text.size(15).white.make(),
          Spacer(),
          credits.text.size(15).white.make(),
          30.heightBox
        ],
      ),
    );
  }
}
