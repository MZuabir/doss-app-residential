import 'package:doss/constants/colors.dart';
import 'package:doss/constants/icons.dart';
import 'package:doss/controllers/chat.dart';
import 'package:doss/utils/size_config.dart';
import 'package:doss/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/message_data.dart';
import 'components/chat_list_view.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  TextEditingController textEditingController = TextEditingController();
  late String senderMessage, receiverMessage;
  final cont=Get.put(ChatCont());
  ScrollController scrollController = ScrollController();

  Future<void> scrollAnimation() async {
    return await Future.delayed(
        const Duration(milliseconds: 100),
            () => scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor:  Colors.black,
        titleSpacing: -8.0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 14.0),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFF90C953),
            child: Text('X',
                style: TextStyle(
                  color: Colors.black,
                )),
          ),
        ),
        title:  ListTile(
          title: Text('Jones Alves',
              style:textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600)),
          subtitle: Text('20/08/2023',
              style: textTheme.bodySmall,
          ),
        ),
        actions:  [
          Center(
            child: Text("Verification",
            style:textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600,color: AppColors.primaryClr) ,
            ),
          ),
          Spacing.x(2.5),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.darkGryClr,
            padding: EdgeInsets.symmetric(
              horizontal:SizeConfig.widthMultiplier*2.5,
              vertical:SizeConfig.heightMultiplier*2.5,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: SizeConfig.widthMultiplier*50,
                  child: Text(
                      "“Good morning, John! Could you check if I locked the gate correctly?”",
                  style: textTheme.bodySmall,

                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.primaryClr
                  ),
                  padding:EdgeInsets.symmetric(
                    horizontal:SizeConfig.widthMultiplier*3,
                    vertical:SizeConfig.heightMultiplier*0.4,
                  ),
                  child: Text("Request resolution",
                  style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600,color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          Spacing.y(1),
          Expanded(child: ChatListView(scrollController: scrollController)),
          Container(
            color: AppColors.tileClr,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5,
                  vertical: SizeConfig.heightMultiplier*2.5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: CircleAvatar(
                      radius: 23,
                      backgroundColor: AppColors.darkGryClr,
                      child: Center(
                        child: Image.asset(AppIcons.clip,
                          height: SizeConfig.heightMultiplier*3,
                          width: SizeConfig.heightMultiplier*3,
                        ),
                      ),
                    ),
                  ),
                  Spacing.x(2),
                  Expanded(
                    child: Container(
                      decoration:  BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.darkGryClr,
                          borderRadius: const BorderRadius.all(Radius.circular(30.0))),
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: textEditingController,
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              maxLines: 6,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: 'Type your message...',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Image.asset(AppIcons.microPhone,
                          height: SizeConfig.heightMultiplier*3.5,
                          width: SizeConfig.heightMultiplier*3.5,
                          ),
                          Spacing.x(3),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                cont.messageList.add(
                                    MessageData(textEditingController.text, false));
                                textEditingController.clear();
                                scrollAnimation();
                              });
                            },
                            onLongPress: () {
                              setState(() {
                                cont.messageList.add(
                                    MessageData(textEditingController.text, true));
                                textEditingController.clear();
                                scrollAnimation();
                              });
                            },
                            child: CircleAvatar(
                              radius: 19,
                              backgroundColor: AppColors.tileClr,
                              child: Center(
                                child: Image.asset(AppIcons.send,
                                  height: SizeConfig.heightMultiplier*3,
                                  width: SizeConfig.heightMultiplier*3,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
