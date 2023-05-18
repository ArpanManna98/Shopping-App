import 'package:eshop/consts/consts.dart';
import 'package:eshop/views/order_screen/components/order_status.dart';

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
        ],
      ),
    );
  }
}
