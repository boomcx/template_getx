import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:template_getx/app/routes/app_pages.dart';

import '../controllers/news_detail_controller.dart';

class NewsDetailView extends GetView<NewsDetailController> {
  const NewsDetailView({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  String? get tag => id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: GetBuilder<NewsDetailController>(
          tag: id,
          builder: (controller) => ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.NEWS_DETAIL, parameters: {
                'id': Random().nextInt(100).toString(),
              });
            },
            child: Text("NewsDetailView ${controller.title}"),
          ),
        ),
      ),
    );
  }
}
