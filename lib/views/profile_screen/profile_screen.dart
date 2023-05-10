import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/consts/consts.dart';
import 'package:eshop/controllers/auth_controller.dart';
import 'package:eshop/controllers/profile_controller.dart';
import 'package:eshop/services/firestore_services.dart';
import 'package:eshop/views/auth_screen/login_screen.dart';
import 'package:eshop/views/profile_screen/components/detailsCard.dart';
import 'package:eshop/views/profile_screen/edit_screen.dart';
import 'package:eshop/widgets_common/bgWidget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return bgWidget(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: redColor,
        //   elevation: 0,
        //   automaticallyImplyLeading: false,
        //   title: "Account".text.fontFamily(semibold).color(darkFontGrey).make(),
        // ),
        body: StreamBuilder(
          stream: FirestoresServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: Lottie.network(
                      "https://assets1.lottiefiles.com/packages/lf20_nzpkqlqn.json",
                      height: 260,
                      width: 260));
            } else {
              var data = snapshot.data!.docs[0];
              return SafeArea(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      20.heightBox,
                      //Edit button design

                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: Icon(
                      //     Icons.edit,
                      //     color: whiteColor,
                      //   ),
                      // ).onTap(() {
                      //   controller.nameController.text = data['name'];
                      //   // controller.passController.text = data['password'];
                      //   Get.to(() => EditScreen(
                      //         data: data,
                      //       ));
                      // }),

                      //User profile detail section design

                      Row(
                        children: [
                          data['imageUrl'] == ''
                              ? Image.asset(
                                  imgProfile2,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make()
                              : Image.network(
                                  data['imageUrl'],
                                  width: 100,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make(),
                          10.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "${data['name']}"
                                    .text
                                    .white
                                    .fontFamily(semibold)
                                    .make(),
                                "${data['email']}".text.white.make(),
                              ],
                            ),
                          ),
                          // OutlinedButton(
                          //   onPressed: () async {
                          //     await Get.put(AuthController())
                          //         .signoutMethod(context);
                          //     Get.offAll(() => const LoginScreen());
                          //   },
                          //   child: "Log out"
                          //       .text
                          //       .color(whiteColor)
                          //       .fontFamily(semibold)
                          //       .make(),
                          //   style: OutlinedButton.styleFrom(
                          //     side: BorderSide(color: whiteColor),
                          //   ),
                          // ),
                        ],
                      ),

                      // User cart, favitem, orders details widget buttons design

                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //cart's total item
                          detailsCard(
                              count: data['cart_count'],
                              title: "In your cart",
                              width: context.screenWidth / 3.4),

                          detailsCard(
                              count: data['wishlist_count'],
                              title: "In your wishlist",
                              width: context.screenWidth / 3.4),
                          detailsCard(
                              count: data['order_count'],
                              title: "Your total orders",
                              width: context.screenWidth / 3.4),
                        ],
                      ),
                      45.heightBox,
                      Card(
                        elevation: 1.0,
                        color: Colors.amberAccent,
                        child: Row(
                          children: [
                            Icon(
                              Icons.shopping_bag,
                              color: Colors.black,
                            ),
                            20.widthBox,
                            "My Orders"
                                .text
                                // .fontFamily(customfont)
                                .bold
                                .black
                                .size(20)
                                .make(),
                          ],
                        ).box.padding(EdgeInsets.all(10)).make().onTap(() {}),
                      ).box.height(70).make(),
                      Card(
                        elevation: 1.0,
                        color: Colors.amberAccent,
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                            ),
                            20.widthBox,
                            "My Wishlists"
                                .text
                                // .fontFamily(customfont)
                                .bold
                                .black
                                .size(20)
                                .make(),
                          ],
                        ).box.padding(EdgeInsets.all(10)).make(),
                      ).box.height(70).make().onTap(() {}),
                      Card(
                        elevation: 1.0,
                        color: Colors.amberAccent,
                        child: Row(
                          children: [
                            Icon(
                              Icons.message,
                              color: Colors.black,
                            ),
                            20.widthBox,
                            "Messages"
                                .text
                                // .fontFamily(customfont)
                                .bold
                                .black
                                .size(20)
                                .make(),
                          ],
                        ).box.padding(EdgeInsets.all(10)).make(),
                      ).box.height(70).make().onTap(() {}),
                      Card(
                        elevation: 1.0,
                        color: Colors.amberAccent,
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            20.widthBox,
                            "Edit Account"
                                .text
                                // .fontFamily(customfont)
                                .bold
                                .black
                                .size(20)
                                .make(),
                          ],
                        ).box.padding(EdgeInsets.all(10)).make(),
                      ).box.height(70).make().onTap(() {
                        controller.nameController.text = data['name'];
                        // controller.passController.text = data['password'];
                        Get.to(() => EditScreen(
                              data: data,
                            ));
                      }),
                      Card(
                        elevation: 1.0,
                        color: Colors.amberAccent,
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.black,
                            ),
                            20.widthBox,
                            "Log Out"
                                .text
                                // .fontFamily(customfont)
                                .bold
                                .black
                                .size(20)
                                .make(),
                          ],
                        ).box.padding(EdgeInsets.all(10)).make(),
                      ).box.height(70).make().onTap(() async {
                        await Get.put(AuthController()).signoutMethod(context);
                        Get.offAll(() => const LoginScreen());
                      }),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
