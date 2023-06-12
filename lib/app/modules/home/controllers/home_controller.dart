import 'dart:async';

import 'package:get/get.dart';
import 'package:template_getx/app.dart';
import 'package:template_getx/models.dart';

class HomeController extends GetxController with PagingMixin<VideoList> {
  /// 标记首次为数据空
  bool tag = true;

  @override
  void onInit() {
    // 可选初始化配置
    // initPaging(isLoadMore: false);
    super.onInit();
  }

  @override
  FutureOr fetchData(int page) async {
    try {
      final data = await NetRepository.client.videoList(page, 20);
      await Future.delayed(const Duration(seconds: 1));
      if (tag) {
        endLoad(data.list as List<VideoList>, maxCount: data.total);
      } else {
        tag = true;
        endLoad([], maxCount: data.total);
      }
    } catch (e) {
      formatError(e);
    }
  }
}
