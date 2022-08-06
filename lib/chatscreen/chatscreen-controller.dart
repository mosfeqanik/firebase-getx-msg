import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class chatscreenController extends GetxController{
  final TextEditingController sendMsgTextController = TextEditingController();
  final fireStore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  var userEmail = ''.obs;
  late final Stream<QuerySnapshot> usersStream;
  bool isFromMe = true;

  String? loggedInEmail = FirebaseAuth.instance.currentUser?.email;
  Map<String, dynamic>? data;
  @override
  void onInit() {
    // TODO: implement onInit
    getCurrentUser();
    getMessages();
    usersStream =
    FirebaseFirestore.instance.collection('messages').snapshots();
    super.onInit();
  }

  Future<void> getCurrentUser() async {
    final user = await auth.currentUser;
    if (user != null) {
      userEmail.value = user.email!;
      print("user email ${user.email}");
    }
  }

  void getMessages() async {
    // final messages = await fireStore.collection('messages').doc();
    // usersStream =
    //     FirebaseFirestore.instance.collection('messages').snapshots()
    //
    //
    // print("hello world ${messages}");
    // await for(var snapshots in fireStore.collection('messages').snapshots()){
    //   for(var messages in snapshots.docs){
    //     print(messages.data());
    //   }
    // }

  }

  sendMsgCollection() {
    fireStore.collection('messages').add({
      'msgSender': userEmail.value,
      'msgText': sendMsgTextController.text,
    });
  }
}
