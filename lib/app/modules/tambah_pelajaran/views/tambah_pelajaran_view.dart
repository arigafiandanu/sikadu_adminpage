import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sikadu_admin/app/widget/buttonW.dart';

import '../../../widget/textfieldW.dart';
import '../controllers/tambah_pelajaran_controller.dart';

class TambahPelajaranView extends GetView<TambahPelajaranController> {
  var kelas = Get.arguments['kelas'];
   TambahPelajaranView({Key? key}) : super(key: key);

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
          'Tambah Pelajaran',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomFormField(
            headingText: "Tambah Pelajaran",
            hintText: "Masukkan Nama Pelajaran",
            obsecureText: false,
            suffixIcon: const SizedBox(),
            controller: controller.tambahPelajaranC,
            maxLines: 1,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.text,
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonW(
            onTap: () {
              controller.tambahPelajaran(kelas);
              print("click");
            },
            text: "Tambah",
          ),
        ],
      ),
    );
  }
}
