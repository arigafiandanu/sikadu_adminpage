import 'package:get/get.dart';

import '../controllers/tambah_pelajaran_controller.dart';

class TambahPelajaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahPelajaranController>(
      () => TambahPelajaranController(),
    );
  }
}
