import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../chatscreen-controller.dart';

class SendMsgBar extends StatelessWidget {
  const SendMsgBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final chatscreenController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}