import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:template_getx/app.dart';
import 'package:template_getx/models.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AAppBar(
        title: 'HomeView',
        isRootNavigator: true,
      ),
      body: SpeedyPagedList<VideoList>.separator(
        controller: controller,
        refreshOnStart: false,
        itemBuilder: (context, index, item) {
          return Text(item.title);
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
      // body: PullRefreshControl(
      //   pagingMixin: controller,
      //   childBuilder: (context, physics) {
      //     return ListView.separated(
      //       physics: physics,
      //       itemCount: controller.items.length,
      //       itemBuilder: (context, index) {
      //         final item = controller.items[index];
      //         return Text(item.title);
      //       },
      //       separatorBuilder: (context, index) => const Divider(),
      //     );
      //   },
      // ),
    );
  }
}
