import 'package:eshop/consts/consts.dart';
import 'package:eshop/consts/lists.dart';
import 'package:eshop/controllers/auth_controller.dart';
import 'package:eshop/views/auth_screen/signup_screen.dart';
import 'package:eshop/views/home_screen/home.dart';
import '../../widgets_common/applogo_widget.dart';
import '../../widgets_common/bgWidget.dart';
import '../../widgets_common/custom_textfield.dart';
import '../../widgets_common/our_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.11).heightBox,
            applogoWidget(),
            10.heightBox,
            "Log in to $appname".text.fontFamily(bold).size(18).white.make(),
            16.heightBox,
            Obx(
              () => Column(
                children: [
                  customTextField(
                      hint: emailHint,
                      title: email,
                      controller: controller.emailController,
                      isPass: false),
                  customTextField(
                      hint: passwordHint,
                      title: password,
                      controller: controller.passwordController,
                      isPass: true),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetpassw.text.make()),
                  ),
                  5.heightBox,
                  controller.isLoading.value
                      ? Lottie.network(
                          "https://assets1.lottiefiles.com/packages/lf20_nzpkqlqn.json",
                          height: 60,
                          width: 60)
                      // ? CircularProgressIndicator(
                      //     valueColor: AlwaysStoppedAnimation(redColor),
                      //   )
                      : ourButton(
                              title: login,
                              color: redColor,
                              onPress: () async {
                                controller.isLoading(true);
                                await controller
                                    .loginMethod(context)
                                    .then((value) {
                                  if (value != null) {
                                    VxToast.show(context,
                                        msg: "Logged in Successful");
                                    Get.offAll(() => Home());
                                  } else {
                                    controller.isLoading(false);
                                  }
                                });
                              },
                              textColor: whiteColor)
                          .box
                          .width(context.screenWidth - 50)
                          .make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  ourButton(
                          title: signup,
                          color: lightGolden,
                          onPress: () {
                            Get.to(() => SignupScreen());
                          },
                          textColor: redColor)
                      .box
                      .width(context.screenWidth - 50)
                      .make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: lightGrey,
                          radius: 25,
                          child: Image.asset(
                            socialIconLists[index],
                            width: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowMd
                  .make(),
            ),
          ],
        ),
      ),
    ));
  }
}
