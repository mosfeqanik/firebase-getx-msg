
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasemessagegetx/mainpage/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chatscreen-controller.dart';

class ChatScreen extends StatelessWidget {
  final chatscreenController controller = Get.put(chatscreenController());
  final height = Get.height;
  final fireStore = FirebaseFirestore.instance;
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
              Container(
                height: height/1.26,
                child: ListView.builder(
                  itemCount: 20,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    print(index);
                    return Container(
                      height: 40,
                      color: (index % 2 == 0) ? Colors.red : Colors.greenAccent,
                    );
                  },
                ),
              ),
              SizedBox(height: 10,),
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

                        fireStore.collection('messages').add({
                          'msgSender':controller.userEmail.value,
                          'msgText':controller.sendMsgTextController.text,
                        });
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


