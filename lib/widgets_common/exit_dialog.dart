import 'package:eshop/consts/consts.dart';
import 'package:eshop/widgets_common/our_button.dart';
import 'package:flutter/services.dart';

Widget exitDialog(context) {
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm".text.fontFamily(bold).size(18).color(darkFontGrey).make(),
        Divider(),
        10.heightBox,
        "Are you sure want to exit?"
            .text
            .fontFamily(bold)
            .size(18)
            .color(darkFontGrey)
            .make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourButton(
              color: redColor,
              textColor: whiteColor,
              title: "Yes",
              onPress: () {
                SystemNavigator.pop();
              },
            ),
            ourButton(
              color: redColor,
              textColor: whiteColor,
              title: "No",
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    ).box.color(lightGrey).padding(EdgeInsets.all(12)).roundedSM.make(),
  );
}
