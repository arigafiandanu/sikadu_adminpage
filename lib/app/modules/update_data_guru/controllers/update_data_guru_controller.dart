import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class UpdateDataGuruController extends GetxController {
  RxBool isLoading = false.obs;

  TextEditingController namaC = TextEditingController();
  TextEditingController nipC = TextEditingController();
  TextEditingController noTelpC = TextEditingController();
  TextEditingController alamatC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  Rx<TextEditingController> kelasC = TextEditingController().obs;

  List dataKelas = [
    "Kelas 1",
    "Kelas 2",
    "Kelas 3",
    "Kelas 4",
    "Kelas 5",
    "Kelas 6"
  ];
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> updateGuru(String email) async {
    isLoading.value = true;
    if (emailC.text.isNotEmpty && namaC.text.isNotEmpty) {
      try {
        Map<String, dynamic> data = {
          "nama": namaC.text,
          "notelp": noTelpC.text,
          "alamat": alamatC.text,
          "nip": nipC.text,
          "mengajarKelas": kelasC.value.text
        };
        Map<String, dynamic> dataUser = {
          "nama": namaC.text,
        };
        if (image != null) {
          File file = File(image!.path);
          String ext = image!.name.split(".").last;

          await storage.ref('profil/$email/foto.$ext').putFile(file);
          String urlImage =
              await storage.ref('profil/$email/foto.$ext').getDownloadURL();

          data.addAll({"foto": urlImage});
          dataUser.addAll({"foto": urlImage});
        }

        await firestore.collection("Guru").doc(email).update(data);
        await firestore.collection("users").doc(email).update(dataUser);

        image = null;
        Get.back();
        Get.snackbar(
            "Update Berhasil", "Data Guru ${namaC.text} Sudah diupdate");
      } catch (e) {
        Get.snackbar("Update Gagal", "Tidak dapat Update Profil");
      } finally {
        isLoading.value = false;
      }
    } else {
      Get.snackbar("Update Gagal", "Data yang dimasukkan kosonh");
    }
  }

  final ImagePicker picker = ImagePicker();
  XFile? image;
  void pickImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    update();
  }

  void hapusImage(String email) async {
    try {
      await firestore.collection('Guru').doc(email).update({
        // "photoUrl": FieldValue.delete(),
        "foto": "foto kosong",
      });

      Get.back();
      Get.snackbar("Update Berhasil", "Foto Berhasil dihapus");
    } catch (e) {
      Get.snackbar("Terjadi Kesalahan", "Tidak dapat menghapus foto");
    }
  }
}
