import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/consts/consts.dart';
import 'package:eshop/controllers/cart_controller.dart';
import 'package:eshop/services/firestore_services.dart';
import 'package:eshop/widgets_common/our_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: "Shopping Cart"
              .text
              .fontFamily(semibold)
              .color(darkFontGrey)
              .make(),
        ),
        body: StreamBuilder(
            stream: FirestoresServices.getCart(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: Lottie.network(
                        "https://assets1.lottiefiles.com/packages/lf20_nzpkqlqn.json"));
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child:
                      "Cart is empty".text.color(darkFontGrey).makeCentered(),
                );
              } else {
                var data = snapshot.data!.docs;
                controller.TotalpriceCalculation(data);
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: Row(
                                  children: [
                                    Image.network(
                                      "${data[index]["img"]}",
                                      width: 100,
                                      height: 100,
                                    ),
                                    5.widthBox,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        "${data[index]["title"]}"
                                            .text
                                            .fontFamily(semibold)
                                            .size(16)
                                            .make(),
                                        5.heightBox,
                                        Row(
                                          children: [
                                            "Quantity:"
                                                .text
                                                .color(Color.fromARGB(
                                                    255, 120, 70, 235))
                                                .fontFamily(bold)
                                                .make(),
                                            "${data[index]["qty"]}"
                                                .text
                                                .color(Color.fromARGB(
                                                    255, 120, 70, 235))
                                                .fontFamily(bold)
                                                .make(),
                                          ],
                                        ),
                                        5.heightBox,
                                        Row(
                                          children: [
                                            "₹"
                                                .text
                                                .color(redColor)
                                                .fontFamily(bold)
                                                .make(),
                                            "${data[index]["tprice"]}"
                                                .numCurrency
                                                // .numCurrencyWithLocale(locale: "hi_IN")
                                                .text
                                                .color(redColor)
                                                .fontFamily(bold)
                                                .make(),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    IconButton(
                                        onPressed: () {
                                          FirestoresServices.deleteItems(
                                              data[index].id);
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: redColor,
                                        )),
                                  ],
                                ),
                                // leading: Image.network("${data[index]["img"]}"),
                                // title: "${data[index]["title"]}"
                                //     .text
                                //     .fontFamily(semibold)
                                //     .size(16)
                                //     .make(),
                                // subtitle: Row(
                                //   children: [
                                //     "₹"
                                //         .text
                                //         .color(redColor)
                                //         .fontFamily(bold)
                                //         .make(),
                                //     "${data[index]["tprice"]}"
                                //         .numCurrency
                                //         // .numCurrencyWithLocale(locale: "hi_IN")
                                //         .text
                                //         .color(redColor)
                                //         .fontFamily(bold)
                                //         .make(),
                                //   ],
                                // ),
                                // trailing: IconButton(
                                //     onPressed: () {
                                //       FirestoresServices.deleteItems(
                                //           data[index].id);
                                //     },
                                //     icon: Icon(
                                //       Icons.delete,
                                //       color: redColor,
                                //     )),
                              );
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "Total Price"
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                          Row(
                            children: [
                              "₹"
                                  .text
                                  .color(darkFontGrey)
                                  .fontFamily(semibold)
                                  .make(),
                              5.widthBox,
                              controller
                                  .totalPrice
                                  .value
                                  .numCurrency
                                  // .numCurrencyWithLocale(locale: "hi_IN")
                                  .text
                                  .color(redColor)
                                  .fontFamily(semibold)
                                  .make(),
                            ],
                          ),
                        ],
                      )
                          .box
                          .padding(EdgeInsets.all(12))
                          .color(lightGolden)
                          .width(context.screenWidth - 60)
                          .roundedSM
                          .make(),
                      10.heightBox,
                      ourButton(
                          title: "Proceed to Buy",
                          color: redColor,
                          textColor: whiteColor,
                          onPress: () {
                            print("working");
                          }).box.width(context.screenWidth - 60).make(),
                    ],
                  ),
                );
              }
            }));
  }
}
