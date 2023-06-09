import 'package:get/get.dart';

import '../controllers/find_controller.dart';

class FindBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<FindController>(
        () => FindController(),
      )
    ];
  }
}
