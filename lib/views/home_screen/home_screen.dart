import 'package:eshop/consts/consts.dart';
import 'package:eshop/consts/lists.dart';
import 'package:eshop/views/home_screen/components/featuredbutton.dart';
import 'package:eshop/widgets_common/homebuttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   

    return Container(
      color: lightGrey,
      padding: EdgeInsets.all(12),
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            // searching box design
            Container(
              alignment: Alignment.center,
              height: 60,
              color: lightGrey,
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchany,
                  helperStyle: TextStyle(color: textfieldGrey),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),

            10.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //1st curosel box design
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: sliderLists.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            sliderLists[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        }),

                    // small widget box design
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          2,
                          (index) => homeButtons(
                                height: context.screenHeight * 0.15,
                                width: context.screenWidth / 2.5,
                                icon: index == 0 ? icTodaysDeal : icFlashDeal,
                                title: index == 0 ? todaydeals : flashsale,
                              )),
                    ),
                    // 2nd curosel design
                    10.heightBox,
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: secoendSliderLists.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            secoendSliderLists[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        }),

                    // categories button design
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          3,
                          (index) => homeButtons(
                                height: context.screenHeight * 0.15,
                                width: context.screenWidth / 3.5,
                                icon: index == 0
                                    ? icTopCategories
                                    : index == 1
                                        ? icBrands
                                        : icTopSeller,
                                title: index == 0
                                    ? topcategories
                                    : index == 1
                                        ? brand
                                        : topsellers,
                              )),
                    ),
                    // feature category text design
                    20.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredcategories.text
                          .size(18)
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make(),
                    ),
                    // featured category widgets design

                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          3,
                          (index) => Column(
                            children: [
                              featuredButton(
                                  title: featuredTitles1[index],
                                  icon: featuredImages1[index]),
                              10.heightBox,
                              featuredButton(
                                  title: featuredTitles2[index],
                                  icon: featuredImages2[index]),
                            ],
                          ),
                        ).toList(),
                      ),
                    ),
                    // featured products design
                    20.heightBox,
                    Container(
                      color: redColor,
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Featured Products"
                              .text
                              .white
                              .fontFamily(bold)
                              .size(18)
                              .make(),
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
                    // 3rd curosel design

                    20.heightBox,
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: secoendSliderLists.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            secoendSliderLists[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        }),

                    // All products section
                    20.heightBox,
                    GridView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            mainAxisExtent: 300),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                imgP7,
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                              Spacer(),
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
                              .padding(EdgeInsets.all(12))
                              .make();
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
