import '../../consts/consts.dart';
import '../../controller/product_controller.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ItemDetails({super.key, this.title, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: darkFontGrey // <-- SEE HERE
            ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: title?.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.share, color: darkFontGrey)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border_outlined, color: darkFontGrey))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Swiper Section
                  VxSwiper.builder(
                      height: 350,
                      viewportFraction: 1.0,
                      aspectRatio: 16 / 9,
                      itemCount: data['p_imgs'].length,
                      itemBuilder: ((context, index) {
                        return Image.network(
                          data["p_imgs"][index],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      })),
                  10.heightBox,
                  // title and details sections
                  title!.text
                      .size(18)
                      .color(darkFontGrey)
                      .fontFamily(bold)
                      .make(),
                  10.heightBox,
                  // rating
                  VxRating(
                    isSelectable: false,
                    value: double.parse(data['p_rating']),
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    maxRating: 5,
                    size: 25,
                    stepInt: true,
                  ),
                  10.heightBox,
                  "${data['p_price']}"
                      .numCurrency
                      .text
                      .color(redColor)
                      .fontFamily(bold)
                      .size(18)
                      .make(),

                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            "${data['p_seller']}"
                                .text
                                .white
                                .fontFamily(semibold)
                                .make(),
                            5.heightBox,
                            "In House Brand"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                          ],
                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.message_rounded,
                          color: darkFontGrey,
                        ),
                      ),
                    ],
                  )
                      .box
                      .height(70)
                      .padding(EdgeInsets.symmetric(horizontal: 16))
                      .color(textfieldGrey)
                      .make(),
                  // color section
                  Obx(
                    () => Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                data['p_colors'].length,
                                (index) => Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    VxBox()
                                        .size(40, 40)
                                        .rounded
                                        .color(Color(data['p_colors'][index])
                                            .withOpacity(1.0))
                                        .margin(EdgeInsets.symmetric(
                                            horizontal: 8.0))
                                        .make()
                                        .onTap(() {
                                      controller.changeColor(index);
                                    }),
                                    Visibility(
                                        visible: index ==
                                            controller.colorIndex.value,
                                        child: const Icon(Icons.done,
                                            color: Colors.white))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),

                        // quantity row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color".text.color(textfieldGrey).make(),
                            ),
                            Obx(
                              () => Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        controller.decreaseQuantity();
                                        controller.calculateTotalPrice(
                                            int.parse(data['p_price']));
                                      },
                                      icon: Icon(Icons.remove)),
                                  controller.quantity.value.text
                                      .size(16)
                                      .color(darkFontGrey)
                                      .fontFamily(bold)
                                      .make(),
                                  IconButton(
                                      onPressed: () {
                                        controller.increseQuantity(
                                            int.parse(data['p_quantity']));
                                        controller.calculateTotalPrice(
                                            int.parse(data['p_price']));
                                      },
                                      icon: Icon(Icons.add)),
                                  10.widthBox,
                                  "(${data['p_quantity']} available)"
                                      .text
                                      .color(redColor)
                                      .make(),
                                ],
                              ),
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),
                        //total row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total".text.color(textfieldGrey).make(),
                            ),
                            "${controller.totalPrice.value}"
                                .numCurrency
                                .text
                                .color(redColor)
                                .fontFamily(bold)
                                .size(16)
                                .make(),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),
                      ],
                    ).box.white.shadowSm.make(),
                  ),
                  // description section
                  "Description"
                      .text
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),
                  10.heightBox,
                  "${data['p_desc']}".text.color(textfieldGrey).make(),

                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                      itemDetailButtonsList.length,
                      (index) => ListTile(
                        title: " ${itemDetailButtonsList[index]}"
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                        trailing: Icon(Icons.arrow_forward),
                      ),
                    ),
                  ),
                  20.heightBox,
                  // product may like section
                  productyoumaylike.text
                      .fontFamily(bold)
                      .size(16)
                      .color(darkFontGrey)
                      .make(),
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
          )),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () {},
              child: "Add to cart".text.fontFamily(semibold).make(),
            ),
          )
        ],
      ),
    );
  }
}
