import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sikadu_admin/app/widget/buttonW.dart';

import '../controllers/update_profil_controller.dart';

class UpdateProfilView extends GetView<UpdateProfilController> {
  final Map<String, dynamic>? user = Get.arguments;

  UpdateProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.emailC.text = user?['email'];
    controller.namaC.text = user?['nama'];
    controller.notelpC.text = user?['noTelp'];
    controller.alamatC.text = user?['alamat'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Update Profil',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 100, color: Colors.transparent),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GetBuilder<UpdateProfilController>(
                    builder: (c) {
                      if (c.image != null) {
                        return ClipOval(
                          child: SizedBox(
                            height: 180,
                            width: 180,
                            child: Image.file(
                              File(c.image!.path),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else {
                        if (user?['foto'] == "foto kosong") {
                          return ClipOval(
                            child: SizedBox(
                              height: 180,
                              width: 180,
                              child: Lottie.asset(
                                "assets/lottie/avatar.json",
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        } else {
                          return ClipOval(
                            child: SizedBox(
                              height: 180,
                              width: 180,
                              child: Image.network(
                                user?['foto'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          controller.pickImage();
                        },
                        child: const Text("Ambil Foto"),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.hapusImage(user?['email']);
                        },
                        child: const Text("Hapus"),
                      )
                    ],
                  )
                ],
              ),
              TextField(
                controller: controller.namaC,
                decoration: InputDecoration(
                  labelText: "Nama Lengkap",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Colors.lightBlue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: controller.notelpC,
                decoration: InputDecoration(
                  labelText: "No Telpon",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Colors.lightBlue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: controller.alamatC,
                decoration: InputDecoration(
                  labelText: "ALamat",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Colors.lightBlue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                readOnly: true,
                controller: controller.emailC,
                decoration: InputDecoration(
                  labelText: "Email",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Colors.lightBlue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Obx(
                () => ButtonW(
                    onTap: () async {
                      if (controller.isLoading.isFalse) {
                        await controller.updateprofil(user!['email']);
                      }
                    },
                    text: controller.isLoading.isFalse
                        ? "Update Profil"
                        : "loading"),
              ),
              // Obx(
              //   () => ElevatedButton(
              //     onPressed: () async {
              //       if (controller.isLoading.isFalse) {
              //         await controller.updateprofil(user!['email']);
              //       }
              //     },
              //     child: Text(controller.isLoading.isFalse
              //         ? "Update Profil"
              //         : "loading"),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
