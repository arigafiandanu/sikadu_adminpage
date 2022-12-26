import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sikadu_admin/app/routes/app_pages.dart';

import '../controllers/mata_pelajaran_perkelas_controller.dart';

class MataPelajaranPerkelasView
    extends GetView<MataPelajaranPerkelasController> {
  var dataKelas = Get.arguments;
  MataPelajaranPerkelasView({Key? key}) : super(key: key);
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
          title: Text(
            'Pelajaran ${dataKelas?['kelas']}',
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.TAMBAH_PELAJARAN,
                      arguments: {"kelas": Get.arguments['kelas']});
                },
                child: const Icon(
                  Icons.add,
                  size: 26.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: StreamBuilder<QuerySnapshot<Object?>>(
          stream: controller.streamPelajaran(dataKelas?['kelas']),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              var dataPelajaran = snapshot.data!.docs;
              if (dataPelajaran.isEmpty) {
                return const Center(
                  child: Text("Belum menambahkan kelas saat ini"),
                );
              } else {
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 10),
                  itemCount: dataPelajaran.length,
                  itemBuilder: (context, index) {
                    var dataItem =
                        dataPelajaran[index].data() as Map<String, dynamic>;
                    return Card(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      borderOnForeground: true,
                      color: Colors.blue.shade100,
                      elevation: 2,
                      child: ListTile(
                        onLongPress: () {
                          Get.defaultDialog(
                              onCancel: () {
                                Get.back();
                              },
                              onConfirm: () {
                                controller.deletePelajaran(dataItem['id']);
                              },
                              textCancel: "Batal",
                              textConfirm: "Hapus",
                              title:
                                  "Hapus Pelajaran ${dataItem['pelajaran']}?",
                              radius: 20,
                              middleText:
                                  "Menghapus mata pelajaran menyebabkan data yang berhubungan menjadi kosong");
                        },
                        title: Text("${dataItem['pelajaran']}"),
                      ),
                    );
                  },
                );
              }
            } else {
              return const Center(
                child: Text("data error"),
              );
            }
          },
        ));
  }
}
