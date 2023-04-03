import 'package:eshop/consts/consts.dart';
import 'package:eshop/controllers/auth_controller.dart';
import 'package:eshop/views/home_screen/home.dart';
import 'package:eshop/widgets_common/applogo_widget.dart';
import 'package:eshop/widgets_common/bgWidget.dart';
import 'package:eshop/widgets_common/custom_textfield.dart';
import 'package:eshop/widgets_common/our_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());
  var isLoading = false.obs;
  // Text Controllers

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.11).heightBox,
            applogoWidget(),
            10.heightBox,
            "Register  to $appname".text.fontFamily(bold).size(18).white.make(),
            16.heightBox,
            Obx(
              () => Column(
                children: [
                  customTextField(
                      hint: nameHint,
                      title: name,
                      controller: nameController,
                      isPass: false),
                  customTextField(
                      hint: emailHint,
                      title: email,
                      controller: emailController,
                      isPass: false),
                  customTextField(
                      hint: passwordHint,
                      title: password,
                      controller: passwordController,
                      isPass: true),
                  customTextField(
                      hint: passwordHint,
                      title: reenterpassword,
                      controller: passwordRetypeController,
                      isPass: true),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetpassw.text.make()),
                  ),
                  5.heightBox,
                  Row(
                    children: [
                      Checkbox(
                          checkColor: whiteColor,
                          activeColor: redColor,
                          value: isCheck,
                          onChanged: (newValue) {
                            setState(() {
                              isCheck = newValue;
                            });
                          }),
                      10.widthBox,
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "I agree to the",
                                style: TextStyle(
                                    fontFamily: regular, color: fontGrey),
                              ),
                              TextSpan(
                                text: " ",
                              ),
                              TextSpan(
                                text: termsandcondition,
                                style: TextStyle(
                                    fontFamily: regular, color: redColor),
                              ),
                              TextSpan(
                                text: " ",
                              ),
                              TextSpan(
                                text: privacypolicy,
                                style: TextStyle(
                                    fontFamily: regular, color: redColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  5.heightBox,
                  controller.isLoading.value
                      ? Lottie.network(
                          "https://assets1.lottiefiles.com/packages/lf20_nzpkqlqn.json",
                          height: 60,
                          width: 60)
                      : ourButton(
                              title: signup,
                              color:
                                  (isCheck == true) ? redColor : disablecolor,
                              onPress: () async {
                                if (isCheck != false) {
                                  controller.isLoading(true);
                                  try {
                                    await controller
                                        .signupMethod(
                                            context: context,
                                            email: emailController.text,
                                            password: passwordController.text)
                                        .then((value) {
                                      return controller.storeUserData(
                                        email: emailController.text,
                                        name: nameController.text,
                                        password: passwordController.text,
                                      );
                                    }).then((value) {
                                      VxToast.show(context,
                                          msg: "Sign in Success");
                                      Get.offAll(() => const Home());
                                    });
                                  } catch (e) {
                                    auth.signOut();
                                    controller.isLoading(false);
                                    // VxToast.show(context, msg: e.toString());
                                  }
                                }
                              },
                              textColor: whiteColor)
                          .box
                          .width(context.screenWidth - 50)
                          .make(),
                  10.heightBox,
                  // RichText(
                  //   text: TextSpan(
                  //     children: [
                  //       TextSpan(
                  //         text: alreadyhaveaccount,
                  //         style: TextStyle(fontFamily: bold, color: fontGrey),
                  //       ),
                  //       TextSpan(
                  //         text: login,
                  //         style: TextStyle(fontFamily: bold, color: redColor),
                  //       ),
                  //     ],
                  //   ),
                  // ).onTap(() {
                  //   Get.back();
                  // })
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      alreadyhaveaccount.text
                          .fontFamily(bold)
                          .color(fontGrey)
                          .make(),
                      login.text.fontFamily(bold).color(redColor).make(),
                    ],
                  ).onTap(() {
                    Get.back();
                  })
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
