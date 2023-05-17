import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:template_getx/app.dart';
import 'package:template_getx/common/extensions/custom_scroll_extension.dart';
import 'package:template_getx/router/router.dart';

import 'service.dart';

void main() async {
  await _initAsync();
  runApp(const MyApp());

  if (Platform.isAndroid) {
    SystemUiOverlayStyle style = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        ///这是设置状态栏的图标和字体的颜色
        ///Brightness.light  一般都是显示为白色
        ///Brightness.dark 一般都是显示为黑色
        statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

_initAsync() async {
  await Hive.initFlutter();
  await Hive.openBox('app');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('zh', 'CN'),
      fallbackLocale: const Locale('zh', 'CN'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', 'CN'),
        Locale('en', 'US'),
      ],
      initialBinding: _loadService(),
      initialRoute: RouteNames.home,
      getPages: GetRoutes.pages,
      scrollBehavior: CustomScrollBehavior(),
      routingCallback: (value) {
        // 切换页面清空当前 Toast
        Toast.toastNavigatorObserver();
        Toast.hideLoading();
      },
      theme: appThemeData,
      defaultTransition: Transition.rightToLeft,
      builder: (context, child) {
        return Toast.init(context, child!);
      },
    );
  }

  Bindings _loadService() {
    return BindingsBuilder(() {
      Get.put(AppService());
      Get.put(UserService());
    });
  }
}
