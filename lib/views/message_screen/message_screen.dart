import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/consts/consts.dart';
import 'package:eshop/services/firestore_services.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Messages".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
        stream: FirestoresServices.getAllMessages(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return "No Messages!".text.color(darkFontGrey).makeCentered();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
