import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/consts/consts.dart';
import 'package:eshop/services/firestore_services.dart';
import 'package:eshop/views/order_screen/orderDetail_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        title: "My Orders".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
        stream: FirestoresServices.getOrderDetails(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return "No Orders Yet!".text.color(darkFontGrey).makeCentered();
          } else {
            var data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: "${index + 1}"
                      .text
                      .fontFamily(bold)
                      .color(darkFontGrey)
                      .xl
                      .make(),
                  title: Row(
                    children: [
                      "Order Id:".text.black.fontFamily(semibold).make(),
                      5.widthBox,
                      data[index]["order_code"]
                          .toString()
                          .text
                          .color(redColor)
                          .fontFamily(semibold)
                          .make(),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      "Amount:".text.black.fontFamily(semibold).make(),
                      5.widthBox,
                      "₹".text.color(darkFontGrey).fontFamily(semibold).make(),
                      3.widthBox,
                      data[index]["total_amount"]
                          .toString()
                          .numCurrency
                          .text
                          .fontFamily(bold)
                          .make(),
                    ],
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        Get.to(() => OrderDetails(data: data[index],));
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: darkFontGrey,
                      )),
                );
              },
            );
          }
        },
      ),
    );
  }
}
