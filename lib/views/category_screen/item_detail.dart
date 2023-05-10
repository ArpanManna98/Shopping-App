import 'package:eshop/consts/consts.dart';
import 'package:eshop/consts/lists.dart';
import 'package:eshop/controllers/product_controller.dart';
import 'package:eshop/views/chat_screen/chat_screen.dart';
import 'package:eshop/widgets_common/our_button.dart';

class ItemDetail extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ItemDetail({Key? key, required this.title, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return WillPopScope(
      onWillPop: () async {
        controller.resetValues();
        return true;
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                controller.resetValues();
                Get.back();
              },
              icon: Icon(Icons.arrow_back)),
          title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
          backgroundColor: lightGrey,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  // color: darkFontGrey,
                )),
            Obx(
              () => IconButton(
                  onPressed: () {
                    if (controller.isFav.value) {
                      controller.removeWishlist(data.id,context);
                      // controller.isFav(false);
                    } else {
                      controller.addWishlist(data.id,context);
                      // controller.isFav(true);
                    }
                  },
                  icon: Icon(
                    Icons.favorite_rounded,
                    color: controller.isFav.value
                        ? Color.fromARGB(255, 255, 4, 4)
                        : darkFontGrey,
                  )),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VxSwiper.builder(
                        itemCount: data['p_images'].length,
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 400,
                        viewportFraction: 1.0,
                        itemBuilder: (context, index) {
                          return Image.network(
                            data["p_images"][index],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      // title design
                      10.heightBox,
                      title!.text
                          .fontFamily(semibold)
                          .size(16)
                          .color(darkFontGrey)
                          .make(),
                      //rating section design
                      10.heightBox,
                      VxRating(
                        value: double.parse(data["p_rating"]),
                        onRatingUpdate: (value) {},
                        normalColor: textfieldGrey,
                        selectionColor: golden,
                        count: 5,
                        size: 25,
                        maxRating: 5,
                        isSelectable: false,
                      ),
                      10.heightBox,
                      Row(
                        children: [
                          "₹"
                              .text
                              .color(redColor)
                              .fontFamily(bold)
                              .size(16)
                              .make(),
                          "${data["p_price"]}"
                              .numCurrency
                              // .numCurrencyWithLocale(locale: "hi_IN")
                              .text
                              .color(redColor)
                              .fontFamily(bold)
                              .size(16)
                              .make(),
                        ],
                      ),
                      10.heightBox,
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                "Seller"
                                    .text
                                    .color(Color.fromARGB(255, 255, 106, 7))
                                    .fontFamily(semibold)
                                    .make(),
                                10.heightBox,
                                "${data["p_seller"]}"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: whiteColor,
                            child: Icon(
                              Icons.message_rounded,
                              color: darkFontGrey,
                            ),
                          ).onTap(() {
                            Get.to(
                              () => ChatScreen(),
                              arguments: [
                                data["p_seller"],
                                data["vendor_id"]
                              ],
                            );
                          })
                        ],
                      )
                          .box
                          .height(60)
                          .padding(EdgeInsets.symmetric(horizontal: 16))
                          .color(textfieldGrey)
                          .make(),
                      // Colour Section
                      20.heightBox,
                      Obx(
                        () => Column(
                          children: [
                            Row(
                              children: [
                                //********** In video's Design**********/
                                // SizedBox(
                                //   width: 100,
                                //   child: "Colors: "
                                //       .text
                                //       .color(Color.fromARGB(255, 255, 77, 7))
                                //       .make(),
                                // ),
                                //*********** My Design***********/
                                "Colors: "
                                    .text
                                    .color(Color.fromARGB(255, 255, 77, 7))
                                    .make(),
                                55.widthBox,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    data["p_colours"].length,
                                    (index) => Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        VxBox()
                                            .size(40, 40)
                                            .roundedFull
                                            .color(Color(data["p_colours"][index])
                                                .withOpacity(1.0))
                                            .margin(EdgeInsets.symmetric(
                                                horizontal: 4))
                                            .make()
                                            .onTap(() {
                                          controller.changeColorIndex(index);
                                        }),
                                        Visibility(
                                            visible: index ==
                                                controller.colorIndex.value,
                                            child: Icon(
                                              Icons.done,
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ).box.padding(EdgeInsets.all(8)).make(),
                            // Quantity Section design

                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: "Quantity: "
                                      .text
                                      .color(Color.fromARGB(255, 255, 77, 7))
                                      .make(),
                                ),
                                Obx(
                                  () => Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            controller.decreaseQunatity();
                                            controller.calculationTotalPrice(
                                                int.parse(
                                                    data["p_price"]));
                                          },
                                          icon: Icon(Icons.remove)),
                                      controller.quantity.value.text
                                          .size(15)
                                          .color(darkFontGrey)
                                          .fontFamily(bold)
                                          .make(),
                                      IconButton(
                                          onPressed: () {
                                            controller.increaseQunatity(
                                                int.parse(
                                                    data["p_quantity"]));
                                            controller.calculationTotalPrice(
                                                int.parse(
                                                    data["p_price"]));
                                          },
                                          icon: Icon(Icons.add)),
                                      10.widthBox,
                                      "Avilable(${data["p_quantity"]})"
                                          .text
                                          .color(textfieldGrey)
                                          .make(),
                                    ],
                                  ),
                                ),
                              ],
                            ).box.padding(EdgeInsets.all(8)).make(),

                            // Total section design
                            Obx(
                              () => Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: "Total: "
                                        .text
                                        .color(Color.fromARGB(255, 255, 77, 7))
                                        .make(),
                                  ),
                                  Row(
                                    children: [
                                      "₹"
                                          .text
                                          .color(redColor)
                                          .fontFamily(bold)
                                          .size(16)
                                          .make(),
                                      "${controller.totalPrice.value}"
                                          .numCurrency
                                          // .numCurrencyWithLocale(locale: "hi_IN")
                                          .text
                                          .color(redColor)
                                          .fontFamily(bold)
                                          .size(16)
                                          .make(),
                                    ],
                                  ),
                                ],
                              ).box.padding(EdgeInsets.all(8)).make(),
                            ),
                          ],
                        ).box.white.shadowSm.make(),
                      ),

                      //description section design
                      10.heightBox,
                      "Description"
                          .text
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .make(),
                      10.heightBox,
                      "${data["p_description"]}"
                          .text
                          .color(darkFontGrey)
                          .make(),

                      //Buttons section design
                      10.heightBox,
                      ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: List.generate(
                          cartButtonDetails.length,
                          (index) => ListTile(
                            title: cartButtonDetails[index]
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            trailing: Icon(Icons.arrow_forward),
                          ),
                        ),
                      ),
                      10.heightBox,
                      "Products you may like"
                          .text
                          .size(16)
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .make(),
                      // product may like section image show design
                      10.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            6,
                            (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  imgP1,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                                10.heightBox,
                                "Laptop 4GB/1TB"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                10.heightBox,
                                "₹55000"
                                    .text
                                    .color(redColor)
                                    .fontFamily(bold)
                                    .size(16)
                                    .make(),
                              ],
                            )
                                .box
                                .white
                                .margin(EdgeInsets.symmetric(horizontal: 4))
                                .rounded
                                .padding(EdgeInsets.all(8))
                                .make(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              child: ourButton(
                color: redColor,
                onPress: () {
                  controller.addToCart(
                    vendorID: data["vendor_id"],
                      color: data["p_colours"]
                          [controller.colorIndex.value],
                      context: context,
                      img: data["p_images"][0],
                      qty: controller.quantity.value,
                      sellername: data["p_seller"],
                      title: data["p_name"],
                      tprice: controller.totalPrice.value);
                  VxToast.show(context, msg: "Added to Cart");
                },
                textColor: whiteColor,
                title: "Add to Cart",
              ),
              width: double.infinity,
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
