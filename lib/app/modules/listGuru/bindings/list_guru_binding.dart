import 'package:get/get.dart';

import '../controllers/list_guru_controller.dart';

class ListGuruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListGuruController>(
      () => ListGuruController(),
    );
  }
}
