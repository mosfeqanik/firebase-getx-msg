import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/login/loginScreen.dart';
import '../auth/register/register-screen.dart';

class Mainpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: Text("Welcome Screen")),
              ElevatedButton(
                onPressed: () {
                  Get.to(()=>LoginScreen());
                },
                child: Text('Login'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(()=>RegisterScreen());
                },
                child: Text('Register'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
