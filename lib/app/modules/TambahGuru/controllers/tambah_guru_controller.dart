import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahGuruController extends GetxController {
  TextEditingController namaC = TextEditingController();
  TextEditingController nipC = TextEditingController();
  TextEditingController noTelpC = TextEditingController();
  TextEditingController alamatC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> tambahGuru() async {
    if (emailC.text.isNotEmpty &&
        namaC.text.isNotEmpty &&
        nipC.text.isNotEmpty) {
      try {
        final userCredential = await auth.createUserWithEmailAndPassword(
          email: emailC.text,
          password: "password",
        );

        if (userCredential.user != null) {
          String? uid = userCredential.user?.uid;

          firestore.collection("users").doc(emailC.text).set({
            "email": emailC.text,
            "nip": nipC.text,
            "nama": namaC.text,
            "uid": uid,
            "noTelp": noTelpC.text,
            "tanggalGabung": DateTime.now().toIso8601String(),
            "image": "noImage",
            "role": "Guru",
          });

          Get.snackbar(
            "Berhasil",
            "Data Guru Berhasil ditambah",
            snackPosition: SnackPosition.BOTTOM,
            borderRadius: 10,
            snackStyle: SnackStyle.FLOATING,
            icon: const Icon(
              Icons.donut_large,
              color: Colors.green,
            ),
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar(
            "Email Telah digunakan",
            "Pastikan email belum terdaftar",
            snackPosition: SnackPosition.BOTTOM,
            borderRadius: 10,
            snackStyle: SnackStyle.FLOATING,
            icon: const Icon(
              Icons.warning,
              color: Colors.red,
            ),
          );
        }
      } catch (e) {
        Get.snackbar(
          "Gagal Menambah kan Data Guru",
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
        "Data Kosong",
        "Pastikan semua data terisi",
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
