import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuatPengumumanController extends GetxController {
  TextEditingController judulC = TextEditingController();
  TextEditingController isiC = TextEditingController();

  var kategoriP = "Umum".obs;
  List dataPengumuman = ["Umum", "Beasiswa", "Libur"];

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> tambahPengumuman() async {
    if (judulC.text.isNotEmpty && isiC.text.isNotEmpty) {
      DocumentReference<Map<String, dynamic>> pengumuman =
          firestore.collection("pengumuman").doc();
      var email = auth.currentUser!.email;
      String? namaUser = (await firestore
          .collection("users")
          .doc(email)
          .get()
          .then((value) => value.data()?['nama'])) as String?;
      try {
        pengumuman.set(
          {
            "id": pengumuman.id,
            "judul": judulC.text,
            "isi": isiC.text,
            "pembuat": namaUser,
            "kategori": kategoriP.value,
          },
        );

        judulC.clear();
        isiC.clear();

        Get.back();
        Get.snackbar(
          "Berhasil",
          "Pengumuman berhasil dibuat",
          snackPosition: SnackPosition.TOP,
          borderRadius: 10,
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(
            Icons.donut_large,
            color: Colors.green,
          ),
        );
      } catch (e) {
        Get.snackbar(
          "Gagal membuat pengumuman",
          "Coba Berberapa saat lagi ",
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(
            Icons.warning,
            color: Colors.red,
          ),
        );
      }
    } else {
      Get.snackbar(
        "Gagal Menambah kan Pengumuman",
        "Pastikan semua terisi",
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        snackStyle: SnackStyle.FLOATING,
        icon: const Icon(
          Icons.warning,
          color: Colors.red,
        ),
      );
    }
  }
}
