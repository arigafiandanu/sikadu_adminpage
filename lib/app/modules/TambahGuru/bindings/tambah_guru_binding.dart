import 'package:get/get.dart';

import '../controllers/tambah_guru_controller.dart';

class TambahGuruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahGuruController>(
      () => TambahGuruController(),
    );
  }
}
