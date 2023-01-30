import '../consts/consts.dart';

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
          )
        ],
      )),
    );
  }
}
