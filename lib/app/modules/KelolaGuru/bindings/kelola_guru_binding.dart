import 'package:get/get.dart';

import '../controllers/kelola_guru_controller.dart';

class KelolaGuruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KelolaGuruController>(
      () => KelolaGuruController(),
    );
  }
}
