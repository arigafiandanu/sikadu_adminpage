import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../widget/buttonW.dart';
import '../../../widget/teksFieldButtonW.dart';
import '../../../widget/textfieldTambahUser.dart';
import '../controllers/update_data_guru_controller.dart';

class UpdateDataGuruView extends GetView<UpdateDataGuruController> {
  var dataGuru = Get.arguments;
  UpdateDataGuruView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.namaC.text = dataGuru?['nama'];
    controller.nipC.text = dataGuru?['nip'];
    controller.noTelpC.text = dataGuru?['noTelp'];
    controller.emailC.text = dataGuru?['email'];
    controller.kelasC.value.text = dataGuru?['mengajarKelas'];

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
          'Update Data Guru ${dataGuru['nama']}',
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
                GetBuilder<UpdateDataGuruController>(
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
                      if (dataGuru?['foto'] == "foto kosong") {
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
                              dataGuru?['foto'],
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
                        controller.hapusImage(dataGuru?['email']);
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
            hintText: "Email",
            obsecureText: false,
            readOnly: true,
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
            readOnly: false,
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
            readOnly: false,
            suffixIcon: const SizedBox(),
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: controller.nipC,
            maxLines: 1,
          ),
          Obx(
            () => TextFormButtonW(
              title: "Wali Kelas",
              hint: controller.kelasC.value.text,
              controller: controller.kelasC.value,
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
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => ButtonW(
                onTap: () async {
                  if (controller.isLoading.isFalse) {
                    await controller.updateGuru(dataGuru!['email']);
                  }
                },
                text: controller.isLoading.isFalse
                    ? "Update data Guru"
                    : "loading"),
          ),
        ],
      ),
    );
  }
}
