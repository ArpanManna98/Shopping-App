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
                      //Edit button design

                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.edit,
                          color: whiteColor,
                        ),
                      ).onTap(() {
                        controller.nameController.text = data['name'];
                        // controller.passController.text = data['password'];
                        Get.to(() => EditScreen(
                              data: data,
                            ));
                      }),

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
                          OutlinedButton(
                            onPressed: () async {
                              await Get.put(AuthController())
                                  .signoutMethod(context);
                              Get.offAll(() => const LoginScreen());
                            },
                            child: "Log out"
                                .text
                                .color(whiteColor)
                                .fontFamily(semibold)
                                .make(),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: whiteColor),
                            ),
                          ),
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
