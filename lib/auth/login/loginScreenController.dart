import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../chatscreen/chatscreen.dart';

class LoginScreenController extends GetxController{
  final TextEditingController emailController= TextEditingController();
  final TextEditingController passwordController= TextEditingController();

  final auth = FirebaseAuth.instance;

///sign in
  signIn() async {
    try {
      final user =auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if(user!=null){
        Get.off(ChatScreen());
      }
    } catch (e) {
      print(e);
    }
  }

}