import '../../consts/consts.dart';
import 'package:velocity_x/velocity_x.dart';

import 'item_details.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return bgColor(Scaffold(
      appBar: AppBar(
        title: title?.text.white.fontFamily(bold).make(),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                      6,
                      (index) => "Baby Clothing"
                          .text
                          .size(12)
                          .color(fontGrey)
                          .fontFamily(semibold)
                          .makeCentered()
                          .box
                          .white
                          .rounded
                          .size(120, 60)
                          .margin(EdgeInsets.symmetric(horizontal: 4))
                          .make())),
            ),
            10.heightBox,
            // items container
            Expanded(
              child: Container(
                color: lightGrey,
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisExtent: 250),
                    itemBuilder: ((context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(imgP5,
                              height: 150, width: 300, fit: BoxFit.fill),
                          5.heightBox,
                          "Laptop 4GB/6GB"
                              .text
                              .fontFamily(semibold)
                              .makeCentered(),
                          5.heightBox,
                          "\$56000"
                              .text
                              .size(18)
                              .fontFamily(bold)
                              .color(redColor)
                              .make(),
                        ],
                      )
                          .box
                          .rounded
                          .white
                          .outerShadowSm
                          .margin(EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10))
                          .make()
                          .onTap(() {
                        Get.to(() => ItemDetails(title: "Dummy Item"));
                      });
                    })),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
