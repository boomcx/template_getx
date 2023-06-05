import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:template_getx/app.dart';

import '../controllers/mine_controller.dart';

class MineView extends GetView<MineController> {
  const MineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const schemeUrl = 'http://8.130.10.201/datax-ui/index1.html';

    return Scaffold(
        appBar: const AAppBar(
          title: 'MineView',
          isRootNavigator: true,
        ),
        body: PullRefreshControl(
          refreshOnStart: false,
          pagingMixin: controller,
          childBuilder: (context, physics) {
            return ListView(
              physics: physics,
              children: [
                ListTile(
                  title: const Text('getInitialLink'),
                  onTap: () async {},
                ),
                ListTile(
                  title: const Text(schemeUrl),
                  onTap: () {
                    Clipboard.setData(
                      const ClipboardData(text: schemeUrl),
                    ).then((value) {
                      Get.snackbar('复制成功', '复制成功');
                    });
                  },
                ),
              ],
            );
          },
        ));
  }
}
