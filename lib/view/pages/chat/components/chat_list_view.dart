import 'package:doss/controllers/chat.dart';
import 'package:doss/view/pages/chat/components/receiver_row_view.dart';
import 'package:doss/view/pages/chat/components/sender_row_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ChatListView extends StatelessWidget {
   ChatListView({Key? key, required this.scrollController}) : super(key: key);

  final ScrollController scrollController;
  final cont=Get.put(ChatCont());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("23 Aug"),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            itemCount: cont.messageList.length,
            itemBuilder: (context, index) => (cont.messageList[index].isSender)
                ? SenderRowView(senderMessage: cont.messageList[index].message)
                : ReceiverRowView(receiverMessage: cont.messageList[index].message),
          ),
        ),
      ],
    );
  }
}
