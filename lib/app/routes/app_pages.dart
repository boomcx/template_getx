// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:template_getx/tabbar.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mine/bindings/mine_binding.dart';
import '../modules/mine/views/mine_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      participatesInRootNavigator: true,
      transition: Transition.noTransition,
      page: () => const TabbarScaffold(
        type: TabbarType.home,
        body: HomeView(),
      ),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MINE,
      participatesInRootNavigator: true,
      transition: Transition.noTransition,
      page: () => const TabbarScaffold(
        type: TabbarType.mine,
        body: MineView(),
      ),
      binding: MineBinding(),
    ),
  ];
}
