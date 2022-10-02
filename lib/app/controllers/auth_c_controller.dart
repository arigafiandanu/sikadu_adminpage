import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthCController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController PasswordC = TextEditingController();
  RxBool hidepass = true.obs;
}
