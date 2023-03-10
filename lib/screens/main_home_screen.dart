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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                  10.heightBox,
                  // featured Categories
                  Align(
                    alignment: Alignment.centerLeft,
                    child: featuredCategories.text
                        .size(18)
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                  ),
                  20.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        3,
                        (index) => Column(
                          children: [
                            featureBtn(
                                icon: featuredImages1[index],
                                title: featuredTitle1[index]),
                            10.heightBox,
                            featureBtn(
                                icon: featuredImages2[index],
                                title: featuredTitle2[index]),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // featured products
                  20.heightBox,
                  Container(
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(color: redColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        featuredProducts.text
                            .fontFamily(semibold)
                            .white
                            .size(18)
                            .make(),
                        10.heightBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: List.generate(
                                  featuredProduct.length,
                                  (index) => Column(
                                        children: [
                                          Image.asset(featuredProduct[index],
                                              width: 150, fit: BoxFit.cover)
                                        ],
                                      )
                                          .box
                                          .white
                                          .rounded
                                          .margin(EdgeInsets.all(5))
                                          .padding(EdgeInsets.all(8))
                                          .make())),
                        )
                      ],
                    ),
                  ),
                  // Third Swiper
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

                  // All Products
                  20.heightBox,
                  GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          mainAxisExtent: 300,
                          crossAxisSpacing: 8),
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            Image.asset(imgP5, width: 200, fit: BoxFit.fill),
                            5.heightBox,
                            "Laptop 4GB/6GB".text.fontFamily(semibold).make(),
                            5.heightBox,
                            "\$56000"
                                .text
                                .size(18)
                                .fontFamily(bold)
                                .color(redColor)
                                .make(),
                          ],
                        ).box.rounded.white.make();
                      }))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
