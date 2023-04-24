import '../../consts/consts.dart';
import 'category_details.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return bgColor(
      Scaffold(
        appBar: AppBar(
          title: category.text.fontFamily(bold).white.make(),
        ),
        body: Container(
            padding: EdgeInsets.all(12),
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 200),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        categoryImages[index],
                        height: 120,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      10.heightBox,
                      "${categoriesList[index]}"
                          .text
                          .color(darkFontGrey)
                          .align(TextAlign.center)
                          .make(),
                    ],
                  )
                      .box
                      .white
                      .rounded
                      .clip(Clip.antiAlias)
                      .outerShadowSm
                      .make()
                      .onTap(() {
                    Get.to(() => CategoryDetails(title: categoriesList[index]));
                  });
                })),
      ),
    );
  }
}
