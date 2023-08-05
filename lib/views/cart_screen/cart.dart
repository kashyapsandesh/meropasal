import '../../consts/consts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: redColor,
        automaticallyImplyLeading: false,
        title: "Shopping Cart".text.fontFamily(semibold).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue,
              ),
            ),
            Row(
              children: [
                "Total Price"
                    .text
                    .size(18)
                    .fontFamily(semibold)
                    .color(darkFontGrey)
                    .make(),
                '40'
                    .numCurrency
                    .text
                    .size(18)
                    .fontFamily(semibold)
                    .color(darkFontGrey)
                    .make(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
