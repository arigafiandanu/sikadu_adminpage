import 'package:get/get.dart';

import '../controllers/list_admin_controller.dart';

class ListAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListAdminController>(
      () => ListAdminController(),
    );
  }
}
