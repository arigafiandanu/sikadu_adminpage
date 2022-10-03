import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DaftarController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController namaC = TextEditingController();
  TextEditingController rePassC = TextEditingController();
  TextEditingController notelp = TextEditingController();

  RxBool hidePassword = true.obs;

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    rePassC.dispose();
    namaC.dispose();
    notelp.dispose();
    super.onClose();
  }
}
