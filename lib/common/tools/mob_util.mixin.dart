// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mobcommonlib/mobcommonlib.dart';
// import 'package:moblink/moblink.dart';

// import 'package:paypark/app.dart';
// import 'package:paypark/pages/entrance/Improve_info/improve_info.dart';
// import 'package:paypark/pages/entrance/security_code/security_code.dart';
// import 'package:paypark/service.dart';

// import '../pages/entrance/login/login.dart';
// import '../routes/app_pages.dart';

// mixin MobUtilMixin {
//   EventChannel? _eventChannel;

//   /// 确认用户协议时，设置协议状态
//   Future policyGrant() async {
//     Mobcommonlib.submitPolicyGrantResult(true, (ret, err) {});
//   }

//   /// 1、设置协议状态
//   /// 2、设置`moblnk`监听
//   FutureOr mobLinkMount() async {
//     print('-------- mobLinkMount listen loading');
//     Moblink.uploadPrivacyPermissionStatus(1, (success) => null);

//     if (GetPlatform.isIOS) {
//       _eventChannel = const EventChannel('MOBLINK_TO_FLUTTER');
//       // Moblink.restoreScene((MLSDKScene scene) {
//       //   showAlert('要还原的路径为：${scene}');
//       //   print('要还原的路径为：${scene.className}');
//       // });
//     } else if (GetPlatform.isAndroid) {
//       // Android 是否安装apk，都执行该监听
//       _eventChannel = const EventChannel('JAVA_TO_FLUTTER');
//     }

//     _eventChannel?.receiveBroadcastStream().listen((event) {
//       print('-------- mobLinkMount listen success');
//       WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//         showAlert('receiveBroadcastStream：${event}');
//         final data = MkResponse.fromMap(event);
//         pushView(data);
//       });
//     }, onError: (error) {
//       print('-------- mobLinkMount listen error');
//       print(error);
//     });
//   }

//   void showAlert(String text) {
//     Get.dialog(
//       CupertinoAlertDialog(
//           title: const Text("提示"),
//           content: Text(text),
//           actions: <Widget>[
//             ElevatedButton(
//               child: const Text("OK"),
//               onPressed: () {
//                 Get.back();
//               },
//             )
//           ]),
//     );
//   }

//   /// 页面跳转
//   void pushView(MkResponse resp) async {
//     if (!UserService.to.isLogined) {
//       if (resp.path == kRouteLogin) {
//         return;
//       }
//       AppService.to.mkResp = resp;
//       return;
//     }

//     /// 重置分享内容
//     AppService.to.mkResp = MkResponse();

//     /// 跳转到指定路径
//     if (resp.isNotEmpty) {
//       /// 未登录时跳转，需要解决路由关闭问题
//       final entrancePages = [kRouteSecurityCode, kRouteImproveInfo];
//       if (entrancePages.contains(Get.routing.current)) {
//         Get.offAllNamed(resp.path, parameters: resp.params);
//         return;
//       }

//       // 判断是否有该页面
//       final routes = AppPages.routes.map((e) => e.name);
//       if (routes.where((element) => element.contains(resp.path)).isNotEmpty) {
//         Get.toNamed(resp.path, parameters: resp.params);
//       }
//     }
//   }
// }

// class MkResponse {
//   /// 页面路径
//   final String path;

//   /// 参数详情
//   final Map<String, String> params;
//   MkResponse({
//     this.path = '',
//     this.params = const {},
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'path': path,
//       'params': params,
//     };
//   }

//   factory MkResponse.fromMap(Map<dynamic, dynamic> map) {
//     return MkResponse(
//       path: map['path'] as String,
//       params: Map<String, String>.from((map['params'] ?? {})),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory MkResponse.fromJson(String source) =>
//       MkResponse.fromMap(json.decode(source) as Map<String, dynamic>);
// }

// // class MKResParams {
// //   final String entId;
// //   final String title;
// //   MKResParams({
// //     this.entId = '',
// //     this.title = '',
// //   });

// //   Map<String, dynamic> toMap() {
// //     return <String, dynamic>{
// //       'entId': entId,
// //       'title': title,
// //     };
// //   }

// //   factory MKResParams.fromMap(Map<dynamic, dynamic> map) {
// //     return MKResParams(
// //       entId: map['entId'] as String,
// //       title: map['title'] as String,
// //     );
// //   }

// //   String toJson() => json.encode(toMap());

// //   factory MKResParams.fromJson(String source) =>
// //       MKResParams.fromMap(json.decode(source) as Map<String, dynamic>);
// // }
// // 