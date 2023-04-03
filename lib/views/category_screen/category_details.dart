import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/consts/consts.dart';
import 'package:eshop/controllers/product_controller.dart';
import 'package:eshop/services/firestore_services.dart';
import 'package:eshop/views/category_screen/item_detail.dart';
import 'package:eshop/widgets_common/bgWidget.dart';

class CategortDetail extends StatelessWidget {
  final String? title;
  const CategortDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).make(),
      ),
      body: StreamBuilder(
        stream: FirestoresServices.getProducts(title),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Lottie.network(
                  "https://assets1.lottiefiles.com/packages/lf20_nzpkqlqn.json",
                  width: 200,
                  height: 200),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: "No products Found".text.color(darkFontGrey).make(),
            );
          } else {
            var data = snapshot.data!.docs;
            return Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(
                        controller.subcat.length,
                        (index) => "${controller.subcat[index]}"
                            .text
                            .size(12)
                            .fontFamily(semibold)
                            .color(fontGrey)
                            .makeCentered()
                            .box
                            .white
                            .rounded
                            .margin(EdgeInsets.symmetric(horizontal: 4))
                            .size(120, 60)
                            .make(),
                      ),
                    ),
                  ),
                  20.heightBox,
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 250,
                            mainAxisSpacing: 3,
                            crossAxisSpacing: 3),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                data[index]["p_images"][1],
                                width: 200,
                                height: 160,
                                fit: BoxFit.cover,
                              ).box.roundedSM.clip(Clip.antiAlias).make(),
                              5.heightBox,
                              "${data[index]["p_name"]}"
                                  .text
                                  .color(darkFontGrey)
                                  .fontFamily(semibold)
                                  .make(),
                              5.heightBox,
                              Row(
                                children: [
                                  "₹"
                                      .text
                                      .color(redColor)
                                      .fontFamily(bold)
                                      .size(16)
                                      .make(),
                                  "${data[index]["p_price"]}"
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
                          )
                              .box
                              .outerShadowLg
                              .white
                              .margin(EdgeInsets.symmetric(horizontal: 4))
                              .roundedSM
                              .padding(EdgeInsets.all(12))
                              .make()
                              .onTap(() {
                            Get.to(() => ItemDetail(
                                title: "${data[index]["p_name"]}",
                                data: data[index]));
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    ));
  }
}
