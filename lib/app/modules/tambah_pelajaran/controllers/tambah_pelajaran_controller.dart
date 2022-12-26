import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahPelajaranController extends GetxController {
  TextEditingController tambahPelajaranC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> tambahPelajaran(String kelas) async {
    if (tambahPelajaranC.text.isNotEmpty) {
      DocumentReference<Map<String, dynamic>> pelajaran =
          firestore.collection("pelajaran").doc();

      try {
        pelajaran.set({
          "kelas": kelas,
          "id": pelajaran.id,
          "pelajaran": tambahPelajaranC.text  
        });

        tambahPelajaranC.clear();
        Get.back();
        Get.snackbar(
          "Berhasil",
          "Pelajaran berhasil ditambah",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 5),
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
          duration: const Duration(seconds: 5),
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
}
