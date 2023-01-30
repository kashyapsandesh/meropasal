import '../consts/consts.dart';
import '../widgets/home_button.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search",
                ),
              ),
            ),
            //swiper for caresoule
            VxSwiper.builder(
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              autoPlay: true,
              height: 150,
              itemCount: slider.length,
              itemBuilder: ((context, index) {
                return Container(
                  child: Image.asset(
                    slider[index],
                    fit: BoxFit.fill,
                  )
                      .box
                      .rounded
                      .margin(EdgeInsets.symmetric(horizontal: 8))
                      .clip(Clip.antiAlias)
                      .make(),
                );
              }),
            ),
            //Todays Deals
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  2.toInt(),
                  (index) => homeButtons(
                      height: context.screenHeight * 0.15,
                      width: context.screenWidth / 2.5,
                      icon: index == 0 ? icTodaysDeal : icFlashDeal,
                      onPress: () {},
                      title: index == 0 ? todayDeal : flashSale)),
            ),
            //second swiper
            10.heightBox,
            VxSwiper.builder(
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              autoPlay: true,
              height: 150,
              itemCount: secondSlider.length,
              itemBuilder: ((context, index) {
                return Container(
                  child: Image.asset(
                    secondSlider[index],
                    fit: BoxFit.fill,
                  )
                      .box
                      .rounded
                      .margin(EdgeInsets.symmetric(horizontal: 8))
                      .clip(Clip.antiAlias)
                      .make(),
                );
              }),
            ),
            //category buttons
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  3.toInt(),
                  (index) => homeButtons(
                      height: context.screenHeight * 0.15,
                      width: context.screenWidth / 4,
                      icon: index == 0
                          ? icTopCategories
                          : index == 1
                              ? icBrands
                              : icTopSeller,
                      onPress: () {},
                      title: index == 0
                          ? topCategories
                          : index == 1
                              ? brand
                              : topSeller)),
            ),
          ],
        ),
      )),
    );
  }
}
