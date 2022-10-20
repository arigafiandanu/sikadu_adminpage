import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sikadu_admin/app/widget/buttonW.dart';
import 'package:sikadu_admin/app/widget/textfieldTambahUser.dart';

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
