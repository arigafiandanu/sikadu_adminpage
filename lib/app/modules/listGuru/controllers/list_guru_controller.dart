import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ListGuruController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamGuru() {
    Query<Map<String, dynamic>> guru =
        firestore.collection("users").where('role', isEqualTo: 'Guru');
    return guru.snapshots();
  }
}
