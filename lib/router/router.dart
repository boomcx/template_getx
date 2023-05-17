import 'package:get/get.dart';
import '../modules/tabbar/tabbar.dart';
import 'package:template_getx/modules/home/index.dart';
import 'package:template_getx/modules/mine/index.dart';

import 'path.dart';

class GetRoutes {
  static List<GetPage> pages = [
    GetPage(
      participatesInRootNavigator: true,
      name: RouteNames.home,
      transition: Transition.noTransition,
      page: () => const TabbarScaffold(
        type: TabbarType.home,
        body: HomePage(),
      ),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),
    GetPage(
      participatesInRootNavigator: true,
      name: RouteNames.mine,
      transition: Transition.noTransition,
      page: () => const TabbarScaffold(
        type: TabbarType.mine,
        body: MinePage(),
      ),
      binding: BindingsBuilder(() {
        Get.lazyPut<MineController>(() => MineController());
      }),
    ),
  ];
}
