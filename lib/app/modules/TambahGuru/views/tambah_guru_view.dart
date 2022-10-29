import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sikadu_admin/app/widget/buttonW.dart';
import 'package:sikadu_admin/app/widget/textfieldTambahUser.dart';

import '../../../widget/teksFieldButtonW.dart';
import '../controllers/tambah_guru_controller.dart';

class TambahGuruView extends GetView<TambahGuruController> {
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
          'Tambah Data Guru',
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
                GetBuilder<TambahGuruController>(
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
                  child: const Text("Ambil Foto Guru"),
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
            headingText: "Nip",
            hintText: "Nip",
            obsecureText: false,
            suffixIcon: const SizedBox(),
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: controller.nipC,
            maxLines: 1,
          ),
          Obx(
            () => TextFormButtonW(
              title: "Wali Kelas",
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
          const SizedBox(
            height: 20,
          ),
          ButtonW(
            onTap: () {
              controller.tambahGuru();
            },
            text: "Tambah Data Guru",
          ),
        ],
      ),
    );
  }
}
