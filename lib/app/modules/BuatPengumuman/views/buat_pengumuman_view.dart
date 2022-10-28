import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sikadu_admin/app/widget/teksFieldButtonW.dart';

import '../../../widget/buttonW.dart';
import '../../../widget/textfieldTambahUser.dart';
import '../controllers/buat_pengumuman_controller.dart';

class BuatPengumumanView extends GetView<BuatPengumumanController> {
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
          'Buat Pengumuman',
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
          CustomFormFieldTambahUser(
            headingText: "Judul",
            hintText: "Judul pengumuman",
            obsecureText: false,
            suffixIcon: const SizedBox(),
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            controller: controller.judulC,
            maxLines: 1,
          ),
          CustomFormFieldTambahUser(
            headingText: "Isi",
            hintText: "Isi Pengumuman",
            obsecureText: false,
            suffixIcon: const SizedBox(),
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            controller: controller.isiC,
            maxLines: 1,
          ),
          Obx(
            () => TextFormButtonW(
              title: "Kategori",
              hint: controller.kategoriP.value,
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
                items: controller.dataPengumuman.map((e) {
                  return DropdownMenuItem(
                    value: e.toString(),
                    child: Text(e.toString()),
                  );
                }).toList(),
                onChanged: (String? kategori) {
                  controller.kategoriP.value = kategori!;
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonW(
            onTap: () {
              controller.tambahPengumuman();
            },
            text: "Tambah Pengumuman",
          ),
        ],
      ),
    );
  }
}
