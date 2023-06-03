import 'package:eshop/consts/consts.dart';
import 'package:eshop/views/order_screen/components/order_info.dart';
import 'package:eshop/views/order_screen/components/order_status.dart';
import 'package:intl/intl.dart' as intl;

class OrderDetails extends StatelessWidget {
  final dynamic data;
  const OrderDetails({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Order Details".text.black.fontFamily(semibold).make(),
        backgroundColor: whiteColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            orderStatus(
                color: redColor,
                icon: Icons.done,
                title: "Placed",
                showDone: data["order_placed"]),
            orderStatus(
                color: Colors.blueAccent,
                icon: Icons.thumb_up_sharp,
                title: "Confirmed",
                showDone: data["order_confirmed"]),
            orderStatus(
                color: Colors.amberAccent,
                icon: Icons.car_crash,
                title: "On Delivery",
                showDone: data["order_on_delivery"]),
            orderStatus(
                color: Colors.deepPurpleAccent,
                icon: Icons.done_all_outlined,
                title: "Delivered",
                showDone: data["order_delivered"]),
            Divider(),
            10.heightBox,
            Card(
              elevation: 0.5,
              child: Column(
                children: [
                  orderInfoDetails(
                    d1: data["order_code"],
                    d2: data["shipping_method"],
                    title1: "Order Id",
                    title2: "Shipping Method",
                  ),
                  orderInfoDetails(
                    d1: intl.DateFormat()
                        .add_yMd()
                        .format((data["order_date"].toDate())),
                    d2: data["payment_method"],
                    title1: "Order Date",
                    title2: "Payment Method",
                  ),
                  orderInfoDetails(
                    d1: "Unpaid",
                    d2: "Order Placed",
                    title1: "Payment Status",
                    title2: "Delivery Status",
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Shipping Address".text.fontFamily(semibold).make(),
                          "${data["order_by_name"]}".text.make(),
                          "${data["order_by_email"]}".text.make(),
                          "${data["order_by_address"]}".text.make(),
                          "${data["order_by_city"]}".text.make(),
                          "${data["order_by_state"]}".text.make(),
                          "${data["order_by_phone"]}".text.make(),
                          "${data["order_by_pincode"]}".text.make(),
                        ],
                      ),
                      100.widthBox,
                      // .box
                      // .padding(EdgeInsets.symmetric(horizontal: 16, vertical: 8))
                      // .make(),
                      Column(
                        children: [
                          "Total Amount".text.fontFamily(semibold).make(),
                          6.heightBox,
                          Row(
                            children: [
                              "₹"
                                  .text
                                  .color(redColor)
                                  .fontFamily(semibold)
                                  .make(),
                              3.widthBox,
                              data["total_amount"]
                                  .toString()
                                  .numCurrency
                                  .text
                                  .color(redColor)
                                  .fontFamily(bold)
                                  .make(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                      .box
                      .padding(EdgeInsets.symmetric(horizontal: 16, vertical: 8))
                      .make(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
