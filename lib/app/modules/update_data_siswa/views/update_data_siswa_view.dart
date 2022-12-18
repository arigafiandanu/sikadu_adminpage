import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../widget/buttonW.dart';
import '../../../widget/teksFieldButtonW.dart';
import '../../../widget/textfieldTambahUser.dart';
import '../controllers/update_data_siswa_controller.dart';

class UpdateDataSiswaView extends GetView<UpdateDataSiswaController> {
  var dataSiswa = Get.arguments;
  UpdateDataSiswaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.namaC.text = dataSiswa?['nama'];
    controller.nisC.text = dataSiswa?['nis'];
    controller.noTelpC.text = dataSiswa?['noTelp'];
    // controller.alamatC.text = dataSiswa?['']
    controller.emailC.text = dataSiswa?['email'];
    controller.namaOrtuC.text = dataSiswa?['namaOrtu'];
    controller.kelasC.value.text = dataSiswa?['kelas'];

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
        title: Text(
          'Update Data ${dataSiswa?['nama']}',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
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
                GetBuilder<UpdateDataSiswaController>(
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
                      if (dataSiswa?['foto'] == "foto kosong") {
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
                              dataSiswa?['foto'],
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
                        controller.hapusImage(dataSiswa?['email']);
                      },
                      child: const Text("Hapus"),
                    )
                  ],
                )
              ],
            ),
          ),
          CustomFormFieldTambahUser(
            headingText: "Email",
            readOnly: true,
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
            readOnly: false,
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
            readOnly: false,
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
              hint: controller.kelasC.value.text,
              controller: controller.kelasC.value,
              widget: DropdownButton(
                icon: const Icon(
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
                  controller.kelasC.value.text = kategori!;
                },
              ),
            ),
          ),
          CustomFormFieldTambahUser(
            headingText: "No Telepon",
            hintText: "No Telepon",
            obsecureText: false,
            readOnly: false,
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
            readOnly: false,
            suffixIcon: const SizedBox(),
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.none,
            controller: controller.namaOrtuC,
            maxLines: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => ButtonW(
                onTap: () async {
                  if (controller.isLoading.isFalse) {
                    await controller.updateSiswa(dataSiswa!['email']);
                  }
                },
                text: controller.isLoading.isFalse
                    ? "Update data siswa"
                    : "loading"),
          ),
        ],
      ),
    );
  }
}
