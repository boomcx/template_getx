import 'dart:async';

import 'package:get/get.dart';
import 'package:template_getx/app.dart';
import 'package:template_getx/models.dart';

class HomeController extends GetxController with PagingMixin<VideoList> {
  @override
  void onInit() {
    // 可选初始化配置
    // initPaging(isLoadMore: true);
    super.onInit();
  }

  @override
  FutureOr loadData(int page) async {
    try {
      final data = await NetRepository.client.videoList(page, 2);
      await Future.delayed(Duration(seconds: 1));
      endLoad(data.list as List<VideoList>, maxCount: data.total);
    } catch (e) {
      formatError(e);
    }
  }
}
