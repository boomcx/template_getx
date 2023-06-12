import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_getx/app.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AAppBar(title: 'LoginView'),
      body: Center(
        child: GetBuilder<LoginController>(
          builder: (controller) => ElevatedButton(
            onPressed: () {},
            child: Text("LoginView ${controller.title}"),
          ),
        ),
      ),
    );
  }
}
