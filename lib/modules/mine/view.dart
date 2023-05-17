import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_getx/app.dart';

import 'index.dart';

class MinePage extends GetView<MineController> {
  const MinePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("MinePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineController>(
      init: MineController(),
      id: "mine",
      builder: (_) {
        return Scaffold(
          appBar: const AAppBar(title: 'mine'),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
