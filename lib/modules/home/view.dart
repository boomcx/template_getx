import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_getx/app.dart';

import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("HomePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: "home",
      builder: (_) {
        return Scaffold(
          appBar: const AAppBar(title: 'home'),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
