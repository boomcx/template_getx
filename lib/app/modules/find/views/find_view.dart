import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/find_controller.dart';

class FindView extends GetView<FindController> {
  const FindView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FindView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FindView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
