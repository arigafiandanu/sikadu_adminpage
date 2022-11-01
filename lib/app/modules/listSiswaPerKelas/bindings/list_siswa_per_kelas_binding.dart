import 'package:get/get.dart';

import '../controllers/list_siswa_per_kelas_controller.dart';

class ListSiswaPerKelasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListSiswaPerKelasController>(
      () => ListSiswaPerKelasController(),
    );
  }
}
