import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_getx/app.dart';
import 'package:template_getx/app/modules/login/bindings/login_binding.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AAppBar(title: 'LoginView'),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(Routes.LOGIN, preventDuplicates: false);
          },
          child: Text("LoginView ${controller.title}"),
        ),
      ),
    );
  }
}
