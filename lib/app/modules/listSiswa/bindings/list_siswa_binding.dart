import 'package:get/get.dart';

import '../controllers/list_siswa_controller.dart';

class ListSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListSiswaController>(
      () => ListSiswaController(),
    );
  }
}
