import 'package:get/get.dart';

import '../controllers/update_data_guru_controller.dart';

class UpdateDataGuruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateDataGuruController>(
      () => UpdateDataGuruController(),
    );
  }
}
