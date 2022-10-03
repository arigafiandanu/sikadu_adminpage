import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sikadu_admin/app/widget/buttonW.dart';

import '../../../controllers/auth_c_controller.dart';
import '../../../widget/textfieldW.dart';
import '../controllers/daftar_controller.dart';

class DaftarView extends GetView<DaftarController> {
  final authC = Get.put(AuthCController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Daftar',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250,
                  child: Lottie.asset(
                    "assets/lottie/daftar_admin.json",
                  ),
                ),
                CustomFormField(
                  headingText: "Email",
                  hintText: "Email",
                  obsecureText: false,
                  suffixIcon: const SizedBox(),
                  controller: controller.namaC,
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.name,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormField(
                  headingText: "Email",
                  hintText: "Email",
                  obsecureText: false,
                  suffixIcon: const SizedBox(),
                  controller: controller.emailC,
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(
                  () => CustomFormField(
                    headingText: "Password",
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    hintText: "Masukan lebih dari 8 karakter",
                    obsecureText: authC.hidepass.value,
                    suffixIcon: IconButton(
                      icon: authC.hidepass.value
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.blue,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: Colors.blue,
                            ),
                      onPressed: () {
                        authC.hidepass.value = !authC.hidepass.value;
                      },
                    ),
                    controller: authC.PasswordC,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(
                  () => CustomFormField(
                    headingText: "Ulangi Password",
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    hintText: "Ulangi Password anda",
                    obsecureText: authC.hidepass.value,
                    suffixIcon: IconButton(
                      icon: authC.hidepass.value
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.blue,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: Colors.blue,
                            ),
                      onPressed: () {
                        authC.hidepass.value = !authC.hidepass.value;
                      },
                    ),
                    controller: authC.PasswordC,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonW(
                  onTap: () {},
                  text: "Daftar",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sudah punya akun?"),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Login"),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
