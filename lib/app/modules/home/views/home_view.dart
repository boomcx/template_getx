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
      body: Center(
        child: SpeedyPagedList<VideoList>.separator(
          controller: controller,
          itemBuilder: (context, index, item) {
            return Text(item.title);
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
        // child: PullRefreshControl(
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
      ),
    );
  }
}
