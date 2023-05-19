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
      body: Column(
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
               orderInfoDetails(
                d1: data["order_code"],
                d2: data["shipping_method"],
                title1: "Order Id",
                title2: "Shipping Method",
               ),
                orderInfoDetails(
                d1: intl.DateFormat().add_yMd().format((data["order_date"].toDate())),
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
        ],
      ),
    );
  }
}
