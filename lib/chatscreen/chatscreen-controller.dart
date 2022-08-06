import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class chatscreenController extends GetxController{
  final TextEditingController sendMsgTextController = TextEditingController();
  final auth = FirebaseAuth.instance;
  var userEmail =''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getCurrentUser();
    super.onInit();
  }

  Future<void> getCurrentUser() async {
    final user = await auth.currentUser;
    if (user != null) {
      userEmail.value = user.email!;
      print("user email ${user.email}");
    }
  }
}
