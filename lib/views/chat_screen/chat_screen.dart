import 'package:eshop/consts/consts.dart';
import 'package:eshop/controllers/chat_controller.dart';
import 'package:eshop/views/chat_screen/components/sender_buble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChatController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: "Title".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SenderBubble(),
                  SenderBubble(),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.msgController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: textfieldGrey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: textfieldGrey,
                        ),
                      ),
                      hintText: "Type Message",
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      controller.sendMsg(controller.msgController.text);
                      controller.msgController.clear();
                    },
                    icon: Icon(
                      Icons.send,
                      color: redColor,
                    ))
              ],
            )
                .box
                .height(80)
                .padding(EdgeInsets.all(12))
                .margin(EdgeInsets.only(bottom: 8))
                .make(),
          ],
        ),
      ),
    );
  }
}
