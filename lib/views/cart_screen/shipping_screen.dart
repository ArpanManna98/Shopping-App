import 'package:eshop/consts/consts.dart';
import 'package:eshop/controllers/cart_controller.dart';
import 'package:eshop/views/cart_screen/payment_screen.dart';
import 'package:eshop/widgets_common/custom_textfield.dart';
import 'package:eshop/widgets_common/our_button.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Shipping Info"
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
              if (controller.addressController.text.length > 10) {
                Get.to(() => PaymentScreen());
              } else {
                VxToast.show(context, msg: "Please Fill the Form");
              }
            },
            textColor: whiteColor,
            title: "Continue"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            customTextField(
                controller: controller.addressController,
                hint: "Address",
                isPass: false,
                title: "Address"),
            customTextField(
                controller: controller.cityController,
                hint: "City",
                isPass: false,
                title: "City"),
            customTextField(
                controller: controller.stateController,
                hint: "State",
                isPass: false,
                title: "State"),
            customTextField(
                controller: controller.pincodeController,
                hint: "Pin Code",
                isPass: false,
                title: "Pin Code"),
            customTextField(
                controller: controller.phoneController,
                hint: "Phone",
                isPass: false,
                title: "Phone"),
          ],
        ),
      ),
    );
  }
}
