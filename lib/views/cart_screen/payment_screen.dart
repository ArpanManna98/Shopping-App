import 'package:eshop/consts/consts.dart';
import 'package:eshop/widgets_common/our_button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Choose Payment Method"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
        backgroundColor: whiteColor,
        elevation: 0.5,
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
            color: redColor,
            onPress: () {},
            textColor: whiteColor,
            title: "Place Order"),
      ),
    );
  }
}
