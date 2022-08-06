import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loginScreenController.dart';

class LoginScreen extends StatelessWidget {
  final LoginScreenController controller = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text("Login"),
              ),
              TextField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              TextField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.signIn();
                  },
                  child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
