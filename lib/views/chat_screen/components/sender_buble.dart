import 'package:eshop/consts/consts.dart';

Widget SenderBubble() {
  return Container(
    margin: EdgeInsets.only(bottom: 8),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: redColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
    ),
    child: Column(
      children: [
        "Message here.....".text.white.size(16).make(),
        10.heightBox,
        "10:00 AM".text.color(whiteColor.withOpacity(0.5)).make(),
      ],
    ),
  );
}
