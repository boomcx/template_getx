import 'dart:async';

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
        refreshOnStart: true,
        itemBuilder: (context, index, item) {
          return GestureDetector(
              onTap: () {
                // Get.to(() => const MyWidget());
                Get.toNamed(Routes.NEWS_DETAIL, parameters: {'id': '1515'});
                // controller.insertItems();
              },
              child: Text(item.title));
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
      // body: PullRefreshControl(
      //   pagingMixin: controller,  <--- mixin pagingMixin类型
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

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with PagingMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AAppBar(
        title: 'mixin widget',
      ),
      body: SpeedyPagedList.separator(
        controller: this,
        itemBuilder: (context, index, item) {
          return Text('data $index');
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }

  @override
  FutureOr fetchData(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    endLoad([1, 2, 2, 2, 2, 2]);
  }
}
