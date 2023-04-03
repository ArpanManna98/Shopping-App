import 'package:eshop/consts/consts.dart';

Widget featuredButton({String? title , icon}) {
  return Row(
    children: [
      Image.asset(icon,width: 60,fit: BoxFit.fill,),
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  ).box.white.roundedSM.outerShadowSm.width(200).margin(EdgeInsets.symmetric(horizontal: 4)).padding(EdgeInsets.all(4)).make();
}
