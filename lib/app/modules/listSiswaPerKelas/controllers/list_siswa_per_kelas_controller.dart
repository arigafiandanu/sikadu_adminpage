import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ListSiswaPerKelasController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamSiswa(String kelas) {
    Query<Map<String, dynamic>> siswa = firestore
        .collection("users")
        .where('role', isEqualTo: 'orangTua')
        .where("kelas", isEqualTo: kelas);
    return siswa.snapshots();
  }
}
