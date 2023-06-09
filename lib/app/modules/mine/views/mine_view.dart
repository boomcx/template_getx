import 'dart:math';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:template_getx/app.dart';

import '../controllers/mine_controller.dart';

class MineView extends GetView<MineController> {
  const MineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AAppBar(
        title: 'MineView',
        isRootNavigator: true,
      ),
      body: Column(
        children: [
          const Text('关闭加载更多'),
          Expanded(
            child: SpeedyPagedGrid(
              controller: controller,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index, item) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(
                      Random().nextInt(255),
                      Random().nextInt(255),
                      Random().nextInt(255),
                      Random().nextInt(255),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text('data $index'),
                );
              },
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 80,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
