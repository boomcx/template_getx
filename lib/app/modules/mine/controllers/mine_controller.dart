import 'dart:async';

import 'package:get/get.dart';
import 'package:template_getx/app.dart';

class MineController extends GetxController with PagingMixin {
  @override
  void onInit() {
    initPaging(isLoadMore: false);
    super.onInit();
  }

  @override
  FutureOr fetchData(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    endLoad([1, 2, 2, 2, 2, 2]);
  }
}
