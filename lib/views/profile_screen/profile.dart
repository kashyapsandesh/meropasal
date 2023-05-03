import '../../consts/consts.dart';
import '../../controller/auth_controller.dart';
import 'components/details_card.dart';
import 'components/edit_profile_screen.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return bgColor(Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(children: [
          // added profile button
          Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.edit,
              color: whiteColor,
            ).onTap(() {
              Get.to(() => EditProfileScreen());
            }),
          ),
          Row(
            children: [
              Image.asset(
                imgProfile2,
                width: 90,
                fit: BoxFit.cover,
              ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.widthBox,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Dummy User".text.size(18).fontFamily(semibold).white.make(),
                  5.heightBox,
                  "customer@example.com".text.white.make()
                ],
              )),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: whiteColor)),
                  onPressed: () async {
                    await Get.put(AuthController()).signoutMethod(context);
                    Get.offAll(() => const LoginScreen());
                  },
                  child: logout.text.white.make())
            ],
          ),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              detailsCard(
                  count: "00",
                  title: "in your cart",
                  width: context.screenWidth / 3.2),
              3.widthBox,
              detailsCard(
                  count: "30",
                  title: "your whistlist",
                  width: context.screenWidth / 3.2),
              3.widthBox,
              detailsCard(
                  count: "05",
                  title: "your order",
                  width: context.screenWidth / 3.2)
            ],
          ),
          // button sections

          ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: ((context, index) {
                    return Divider(color: lightGrey);
                  }),
                  itemCount: profileButtonsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Image.asset(
                        profileButtonsIcon[index],
                        width: 22,
                      ),
                      title: profileButtonsList[index].text.make(),
                    );
                  })
              .box
              .white
              .margin(EdgeInsets.all(12))
              .rounded
              .padding(const EdgeInsets.symmetric(horizontal: 16))
              .make()
              .box
              .width(context.screenWidth)
              .color(redColor)
              .make(),
        ]),
      ),
    )));
  }
}
