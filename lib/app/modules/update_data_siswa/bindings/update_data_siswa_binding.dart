import 'package:get/get.dart';

import '../controllers/update_data_siswa_controller.dart';

class UpdateDataSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateDataSiswaController>(
      () => UpdateDataSiswaController(),
    );
  }
}
