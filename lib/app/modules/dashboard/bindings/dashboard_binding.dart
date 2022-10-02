import 'package:get/get.dart';
import 'package:sikadu_admin/app/modules/home/controllers/home_controller.dart';
import 'package:sikadu_admin/app/modules/list_chat/controllers/list_chat_controller.dart';
import 'package:sikadu_admin/app/modules/profil/controllers/profil_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ListChatController>(
      () => ListChatController(),
    );
    Get.lazyPut<ProfilController>(
      () => ProfilController(),
    );
  }
}
