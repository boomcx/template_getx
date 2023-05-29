import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:template_getx/app.dart';

import '../controllers/mine_controller.dart';

class MineView extends GetView<MineController> {
  const MineView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AAppBar(
        title: 'MineView',
        isRootNavigator: true,
      ),
      body: Center(
        child: Text(
          'MineView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
