import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TambahSiswaController extends GetxController {
  TextEditingController namaC = TextEditingController();
  TextEditingController nisC = TextEditingController();
  TextEditingController noTelpC = TextEditingController();
  TextEditingController alamatC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController namaOrtuC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  var kategoriKelas = "Kelas 1".obs;
  List dataKelas = [
    "Kelas 1",
    "Kelas 2",
    "Kelas 3",
    "Kelas 4",
    "Kelas 5",
    "Kelas 6"
  ];

  final ImagePicker picker = ImagePicker();
  XFile? imageP;
  String dataImage = "foto kosong";

  Future<void> tambahDataSiswa() async {
    if (emailC.text.isNotEmpty &&
        namaC.text.isNotEmpty &&
        nisC.text.isNotEmpty &&
        namaOrtuC.text.isNotEmpty &&
        emailC.text.isEmail) {
      try {
        final userCredential = await auth.createUserWithEmailAndPassword(
          email: emailC.text,
          password: "password",
        );

        if (userCredential.user != null) {
          if (imageP != null) {
            File file = File(imageP!.path);
            String ext = imageP!.name.split(".").last;

            await storage.ref('profil/${emailC.text}/foto.$ext').putFile(file);
            String urlImage = await storage
                .ref('profil/${emailC.text}/foto.$ext')
                .getDownloadURL();
            dataImage = urlImage;
          }

          String? uid = userCredential.user?.uid;

          await firestore.collection("users").doc(emailC.text).set({
            "email": emailC.text,
            "nama": namaC.text,
            "namaOrtu": namaOrtuC.text,
            "uid": uid,
            "foto": dataImage,
            "role": "orangTua",
          });

          //menyimpan data collection didalam collection user dengan nama data siswa
          // await firestore
          //     .collection("users")
          //     .doc(emailC.text)
          //     .collection("Data Siswa")
          //     .doc(emailC.text)
          //     .set({
          //   "email": emailC.text,
          //   "nis": nisC.text,
          //   "nama": namaC.text,
          //   "uid": uid,
          //   "noTelp": noTelpC.text,
          //   "tanggalGabung": DateTime.now().toIso8601String(),
          //   "foto": dataImage,
          //   "role": "orangTua",
          //   "namaOrtu": namaOrtuC.text,
          //   "kelas": kategoriKelas.value,
          // });

          //menyimpan data kedalam collection siswa
          await firestore.collection("Siswa").doc(emailC.text).set({
            "email": emailC.text,
            "nis": nisC.text,
            "nama": namaC.text,
            "uid": uid,
            "noTelp": noTelpC.text,
            "tanggalGabung": DateTime.now().toIso8601String(),
            "foto": dataImage,
            "role": "orangTua",
            "namaOrtu": namaOrtuC.text,
            "kelas": kategoriKelas.value,
            "nilai": {}
          });

          Get.back();
          Get.snackbar(
            "Berhasil",
            "Data Siswa Berhasil ditambah",
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
            animationDuration: const Duration(seconds: 10),
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

  void pickImage() async {
    imageP = await picker.pickImage(source: ImageSource.gallery);
    if (imageP.toString().isEmpty) {
      return;
    } else {
      update();
    }
  }
}
