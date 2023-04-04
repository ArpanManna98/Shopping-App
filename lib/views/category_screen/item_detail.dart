import 'package:eshop/consts/consts.dart';
import 'package:eshop/consts/lists.dart';
import 'package:eshop/widgets_common/our_button.dart';

class ItemDetail extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ItemDetail({Key? key, required this.title, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        backgroundColor: lightGrey,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                // color: darkFontGrey,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
                // color: darkFontGrey,
              ))
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
                        ),
                      ],
                    )
                        .box
                        .height(60)
                        .padding(EdgeInsets.symmetric(horizontal: 16))
                        .color(textfieldGrey)
                        .make(),
                    // Colour Section
                    20.heightBox,
                    Column(
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
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Color(data["p_colours"][index])
                                        .withOpacity(1.0))
                                    .margin(EdgeInsets.symmetric(horizontal: 4))
                                    .make(),
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
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.remove)),
                                "0"
                                    .text
                                    .size(15)
                                    .color(darkFontGrey)
                                    .fontFamily(bold)
                                    .make(),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.add)),
                                10.widthBox,
                                "Avilable(${data["p_quantity"]})"
                                    .text
                                    .color(textfieldGrey)
                                    .make(),
                              ],
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),

                        // Total section design
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total: "
                                  .text
                                  .color(Color.fromARGB(255, 255, 77, 7))
                                  .make(),
                            ),
                            "₹0.00"
                                .text
                                .color(redColor)
                                .size(16)
                                .fontFamily(bold)
                                .make(),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),
                      ],
                    ).box.white.shadowSm.make(),

                    //description section design
                    10.heightBox,
                    "Description"
                        .text
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    "${data["p_description"]}".text.color(darkFontGrey).make(),

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
              onPress: () {},
              textColor: whiteColor,
              title: "Add to Cart",
            ),
            width: double.infinity,
            height: 60,
          ),
        ],
      ),
    );
  }
}
