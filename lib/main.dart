import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sikadu_admin/app/controllers/auth_c_controller.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthCController(), permanent: true);
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LOGIN,
      getPages: AppPages.routes,
    );
  }
}
