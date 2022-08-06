
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chatscreen-controller.dart';
import 'components/sendMsgBar.dart';

class ChatScreen extends StatelessWidget {
  final chatscreenController controller = Get.put(chatscreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("chatscreen"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 500,
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
              SendMsgBar(controller: controller)
            ],
          ),
        ));
  }
}


