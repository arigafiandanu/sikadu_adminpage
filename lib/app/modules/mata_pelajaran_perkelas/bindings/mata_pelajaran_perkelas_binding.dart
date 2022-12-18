import 'package:get/get.dart';

import '../controllers/mata_pelajaran_perkelas_controller.dart';

class MataPelajaranPerkelasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MataPelajaranPerkelasController>(
      () => MataPelajaranPerkelasController(),
    );
  }
}
