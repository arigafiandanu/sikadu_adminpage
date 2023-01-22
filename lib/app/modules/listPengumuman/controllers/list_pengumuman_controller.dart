import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ListPengumumanController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamPengumuman() {
    Query<Map<String, dynamic>> pengumuman = firestore.collection("pengumuman");
    return pengumuman.snapshots();
  }

  void deteteDocument(String id) async {
    try {
      await firestore.collection("pengumuman").doc(id).delete();
      Get.back();
      Get.snackbar("Berhasil", "Penguman berhasil dihapus");
    } catch (e) {
      Get.back();
      Get.snackbar(
          "Gagal menghapus pengumuman", "Silahkan coba beberapa saat lagi");
    }
  }
}
