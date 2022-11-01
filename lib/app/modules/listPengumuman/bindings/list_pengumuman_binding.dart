import 'package:get/get.dart';

import '../controllers/list_pengumuman_controller.dart';

class ListPengumumanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPengumumanController>(
      () => ListPengumumanController(),
    );
  }
}
