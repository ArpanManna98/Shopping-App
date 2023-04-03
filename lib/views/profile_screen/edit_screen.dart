import 'dart:io';

import 'package:eshop/consts/consts.dart';
import 'package:eshop/controllers/profile_controller.dart';
import 'package:eshop/views/profile_screen/profile_screen.dart';
import 'package:eshop/widgets_common/bgWidget.dart';
import 'package:eshop/widgets_common/custom_textfield.dart';
import 'package:eshop/widgets_common/our_button.dart';

class EditScreen extends StatelessWidget {
  final dynamic data;
  const EditScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Obx(
          () => Column(mainAxisSize: MainAxisSize.min, children: [
            data['imageUrl'] == '' && controller.profileImagePath.isEmpty
                ? Image.asset(
                    imgProfile2,
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()
                : data['imageUrl'] != '' && controller.profileImagePath.isEmpty
                    ? Image.network(
                        data['imageUrl'],
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : Image.file(
                        File(controller.profileImagePath.value),
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ourButton(
                color: redColor,
                textColor: whiteColor,
                title: 'Change',
                onPress: () {
                  controller.changeImage(context);
                }),
            Divider(),
            20.heightBox,
            customTextField(
                title: name,
                hint: nameHint,
                controller: controller.nameController,
                isPass: false),
            10.heightBox,
            customTextField(
                title: "Old Password",
                hint: passwordHint,
                controller: controller.oldpassController,
                isPass: true),
            10.heightBox,
            customTextField(
                title: "New Password",
                hint: passwordHint,
                controller: controller.newpassController,
                isPass: true),
            20.heightBox,
            controller.isLoading.value
                ? Lottie.network(
                    "https://assets1.lottiefiles.com/packages/lf20_nzpkqlqn.json",
                    height: 80,
                    width: 80)
                : SizedBox(
                    width: context.screenWidth - 70,
                    child: ourButton(
                        color: redColor,
                        textColor: whiteColor,
                        title: 'Save',
                        onPress: () async {
                          controller.isLoading(true);
                          if (controller.profileImagePath.value.isNotEmpty) {
                            await controller.uploadImage();
                          } else {
                            controller.profileImageLink = data['imageUrl'];
                          }
                          if (data['password'] ==
                              controller.oldpassController.text) {
                            await controller.changeAuthPassword(
                                email: data['email'],
                                newPassword: controller.newpassController.text,
                                password: controller.oldpassController.text);
                            await controller.updateProfile(
                                imgUrl: controller.profileImageLink,
                                name: controller.nameController.text,
                                password: controller.newpassController.text);
                            VxToast.show(context, msg: "Updated Succesfully");
                            Get.to(() => ProfileScreen(),
                                duration: Duration(seconds: 1),
                                transition: Transition.rightToLeftWithFade);
                          } else {
                            VxToast.show(context,
                                msg: "Old Password is not matched");
                            controller.isLoading(false);
                          }
                        }),
                  ),
          ])
              .box
              .white
              .shadowSm
              .padding(EdgeInsets.all(16))
              .margin(EdgeInsets.only(top: 50, right: 12, left: 12))
              .roundedLg
              .make(),
        ),
      ),
    );
  }
}
