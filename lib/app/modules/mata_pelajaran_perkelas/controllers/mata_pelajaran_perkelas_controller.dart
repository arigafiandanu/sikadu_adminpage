import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MataPelajaranPerkelasController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamPelajaran(String kelas) {
    Query<Map<String, dynamic>> mataPelajaran =
        firestore.collection("pelajaran").where("kelas", isEqualTo: kelas);

    return mataPelajaran.snapshots();
  }

  void deletePelajaran(String doc) {
    try {
      firestore.collection("pelajaran").doc(doc).delete();
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
      Get.back();
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
