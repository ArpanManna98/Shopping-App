import 'package:eshop/consts/consts.dart';
import 'package:eshop/consts/lists.dart';
import 'package:eshop/controllers/cart_controller.dart';
import 'package:eshop/widgets_common/our_button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
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
            onPress: () {
              controller.placeMyOrder(
                  orderPaymentMethod:
                      paymentsmethodnames[controller.paymentIndex.value],
                  totalAmount: controller.totalPrice.value);
            },
            textColor: whiteColor,
            title: "Place Order"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Obx(
          () => Column(
            children: List.generate(paymentsmethodimges.length, (index) {
              return Container(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(8),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.asset(
                      paymentsmethodimges[index],
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    controller.paymentIndex.value == index
                        ? Transform.scale(
                            scale: 1.3,
                            child: Checkbox(
                                activeColor: Colors.green,
                                value: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                onChanged: (Value) {}),
                          )
                        : Container(),
                  ],
                ),
              ).onTap(() {
                controller.changePaymentIndex(index);
              });
            }),
          ),
        ),
      ),
    );
  }
}
