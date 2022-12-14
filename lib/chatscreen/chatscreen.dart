
import 'package:firebasemessagegetx/mainpage/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chatscreen-controller.dart';
import 'components/chatmsgbuble.dart';

class ChatScreen extends StatelessWidget {
  final chatscreenController controller = Get.put(chatscreenController());
  final height = Get.height;

  @override
  Widget build(BuildContext context) {
    print(height);
    return Scaffold(
        appBar: AppBar(
          title: Obx(()=>Text(controller.userEmail.value.isNotEmpty?controller.userEmail.value:"No user found")),
          actions: [
            IconButton(onPressed: (){
              controller.auth.signOut();
              Get.off(()=>Mainpage());
            }, icon: Icon(Icons.close))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChatBubble(),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      margin: EdgeInsets.only(left: 10),
                      height: 80,
                      width: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                        ),
                        border: Border.all(
                          width: 3,
                          color: Colors.blue,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: TextField(
                        controller: controller.sendMsgTextController,
                        decoration: InputDecoration(
                          hintText: "Write Anything",
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        print(controller.sendMsgTextController.text);

                        controller.sendMsgCollection();
                        controller.sendMsgTextController.clear();

                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.send,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}


