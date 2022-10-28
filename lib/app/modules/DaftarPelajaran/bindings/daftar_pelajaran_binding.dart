import 'package:get/get.dart';

import '../controllers/daftar_pelajaran_controller.dart';

class DaftarPelajaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarPelajaranController>(
      () => DaftarPelajaranController(),
    );
  }
}
