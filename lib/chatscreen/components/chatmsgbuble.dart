import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../chatscreen-controller.dart';
class ChatBubble extends StatelessWidget {
  final chatscreenController controller = Get.put(chatscreenController());
  final height = Get.height;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: controller.usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return Container(
          height: height/1.26,
          child: new ListView(
            padding: EdgeInsets.all(10.0),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              controller.data = document.data() as Map<String, dynamic>;
              String email = controller.data?['msgSender'];
              String message = controller.data?['msgText'];
              controller.isFromMe = controller.loggedInEmail == email;
              return Column(
                crossAxisAlignment: controller.isFromMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: controller.isFromMe
                              ? Radius.circular(20.0)
                              : Radius.circular(0.0),
                          bottomLeft: Radius.circular(20.0),
                          topRight: controller.isFromMe
                              ? Radius.circular(0.0)
                              : Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        )),
                    margin: EdgeInsets.all(5.0),
                    color: controller.isFromMe ? Colors.lightBlue : Colors.blueGrey,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            email,
                            style: TextStyle(
                              color: Colors.lightGreenAccent,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
