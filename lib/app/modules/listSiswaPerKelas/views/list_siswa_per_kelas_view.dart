import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sikadu_admin/app/routes/app_pages.dart';

import '../controllers/list_siswa_per_kelas_controller.dart';

class ListSiswaPerKelasView extends GetView<ListSiswaPerKelasController> {
  const ListSiswaPerKelasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var kelasId = Get.arguments['id'];
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
          'Siswa $kelasId',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamSiswa(kelasId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            var listData = snapshot.data!.docs;
            if (listData.isEmpty) {
              return Center(
                child: Text("Belum ada siswa di $kelasId"),
              );
            } else {
              return ListView.builder(
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  var dataItem = listData[index].data() as Map<String, dynamic>;
                  return Card(
                    margin: const EdgeInsets.all(5),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      onTap: () {
                        Get.toNamed(Routes.DETAIL_SISWA, arguments: dataItem);
                      },
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.transparent,
                        child: ClipRect(
                          child: dataItem['foto'] != 'imageKosong'
                              ? Image.network(
                                  dataItem['foto'],
                                  fit: BoxFit.cover,
                                )
                              : Lottie.asset(
                                  "assets/lottie/avatar.json",
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      title: Text(dataItem['nama']),
                      subtitle: Text(dataItem['nip']),
                      trailing: const Icon(Icons.arrow_right),
                    ),
                  );
                },
              );
            }
          } else {
            return const Center(
              child: Text("error"),
            );
          }
        },
      ),
    );
  }
}
