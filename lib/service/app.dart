import 'package:event_bus/event_bus.dart';
import 'package:get/get.dart';

class AppService extends GetxService {
  static AppService get to => Get.find();

  /// 全局通知
  static EventBus get bus => to._bus;
  final _bus = EventBus();
}

class AppNeedToLogin {}
