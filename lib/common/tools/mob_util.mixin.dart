import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobcommonlib/mobcommonlib.dart';
import 'package:moblink/moblink.dart';

mixin MobUtilMixin {
  final EventChannel _eventChannel = const EventChannel('JAVA_TO_FLUTTER');

  /// 确认用户协议时，设置协议状态
  void policyGrant() {
    Mobcommonlib.submitPolicyGrantResult(true, (ret, err) {});
  }

  /// 1、设置协议状态
  /// 2、设置`moblnk`监听
  FutureOr mobLinkMount() async {
    Moblink.uploadPrivacyPermissionStatus(1, (success) => null);

    // Android 是否安装apk，都执行该监听
    _eventChannel.receiveBroadcastStream().listen((event) {
      print('-------------------- listen success');
      print(event);
      showAlert('$event');
    }, onError: (error) {
      print('-------------------- listen error');
      print(error);
      showAlert('$error');
    });

    // iOS
    if (GetPlatform.isIOS) {
      Moblink.restoreScene((MLSDKScene scene) {
        showAlert('要还原的路径为：${scene.className}');
        print('要还原的路径为：${scene.className}');
      });
    } else if (GetPlatform.isAndroid) {
      // Moblink.restoreScene_Android();
    }
  }

  void showAlert(String text) {
    Get.dialog(
      CupertinoAlertDialog(
          title: const Text("提示"),
          content: Text(text),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Get.back();
              },
            )
          ]),
    );
  }
}
