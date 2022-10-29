import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../widget/buttonW.dart';
import '../../../widget/teksFieldButtonW.dart';
import '../../../widget/textfieldTambahUser.dart';
import '../controllers/tambah_siswa_controller.dart';

class TambahSiswaView extends GetView<TambahSiswaController> {
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
          'Tambah Data Siswa',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GetBuilder<TambahSiswaController>(
                  builder: (c) {
                    if (c.imageP != null) {
                      return ClipOval(
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Image.file(
                            File(c.imageP!.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          controller.pickImage();
                        },
                        child: Container(
                          width: Get.width * 0.4,
                          height: Get.height * 0.15,
                          alignment: Alignment.center,
                          child: Lottie.asset(
                            "assets/lottie/avatar.json",
                            alignment: Alignment.center,
                          ),
                        ),
                      );
                    }
                  },
                ),
                TextButton(
                  onPressed: () {
                    controller.pickImage();
                  },
                  child: const Text("Ambil Foto MUrid"),
                )
              ],
            ),
          ),
          CustomFormFieldTambahUser(
            headingText: "Email",
            hintText: "Email",
            obsecureText: false,
            suffixIcon: const SizedBox(),
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            controller: controller.emailC,
            maxLines: 1,
          ),
          CustomFormFieldTambahUser(
            headingText: "Nama",
            hintText: "Nama",
            obsecureText: false,
            suffixIcon: const SizedBox(),
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            controller: controller.namaC,
            maxLines: 1,
          ),
          CustomFormFieldTambahUser(
            headingText: "Nis",
            hintText: "Nis",
            obsecureText: false,
            suffixIcon: const SizedBox(),
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: controller.nisC,
            maxLines: 1,
          ),
          Obx(
            () => TextFormButtonW(
              title: "Masuk Kelas",
              hint: controller.kategoriKelas.value,
              controller: null,
              widget: DropdownButton(
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                ),
                iconSize: 35,
                elevation: 4,
                underline: Container(
                  height: 0,
                ),
                items: controller.dataKelas.map((e) {
                  return DropdownMenuItem(
                    value: e.toString(),
                    child: Text(e.toString()),
                  );
                }).toList(),
                onChanged: (String? kategori) {
                  controller.kategoriKelas.value = kategori!;
                },
              ),
            ),
          ),
          CustomFormFieldTambahUser(
            headingText: "No Telepon",
            hintText: "No Telepon",
            obsecureText: false,
            suffixIcon: const SizedBox(),
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: controller.noTelpC,
            maxLines: 1,
          ),
          CustomFormFieldTambahUser(
            headingText: "Nama Orang Tua",
            hintText: "Nama Orang Tua",
            obsecureText: false,
            suffixIcon: const SizedBox(),
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.none,
            controller: controller.namaOrtuC,
            maxLines: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonW(
            onTap: () {
              controller.tambahDataSiswa();
            },
            text: "Tambah Data Siswa",
          ),
        ],
      ),
    );
  }
}
