import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class chatscreenController extends GetxController{
  final TextEditingController sendMsgTextController = TextEditingController();
  final fireStore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  var userEmail = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getCurrentUser();
    getMessages();
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
    final messages = await fireStore.collection('messages').doc();
    await for(var snapshots in fireStore.collection('messages').snapshots()){
      for(var messages in snapshots.docs){
        print(messages.data());
      }
    }

  }

  sendMsgCollection() {
    fireStore.collection('messages').add({
      'msgSender': userEmail.value,
      'msgText': sendMsgTextController.text,
    });
  }
}
