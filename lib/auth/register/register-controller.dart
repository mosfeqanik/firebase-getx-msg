import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../chatscreen/chatscreen.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    // Firebase.initializeApp().whenComplete(() {
    //   print("completed");
    // });
    super.onInit();
  }

  signUp() async {
    try {
      final newuser = auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if(newuser!=null){
        Get.off(ChatScreen());
      }
    } catch (e) {
      print(e.toString());
    }
  }

}

