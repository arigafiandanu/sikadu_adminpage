import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sikadu_admin/app/routes/app_pages.dart';

import '../controllers/daftar_pelajaran_controller.dart';

class DaftarPelajaranView extends GetView<DaftarPelajaranController> {
  const DaftarPelajaranView({Key? key}) : super(key: key);
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
        title: const Text(
          'Daftar Pelajaran',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            borderOnForeground: true,
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              onTap: () {
                Get.toNamed(Routes.MATA_PELAJARAN_PERKELAS,
                    arguments: {"kelas": "Kelas 1"});
              },
              title: const Text("Pelajaran Kelas 1"),
              trailing: const Icon(Icons.arrow_right),
              style: ListTileStyle.list,
              tileColor: Colors.blue[50],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            borderOnForeground: true,
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              onTap: () {
                Get.toNamed(Routes.MATA_PELAJARAN_PERKELAS,
                    arguments: {"kelas": "Kelas 2"});
              },
              title: const Text("Pelajaran Kelas 2"),
              trailing: const Icon(Icons.arrow_right),
              style: ListTileStyle.list,
              tileColor: Colors.blue[50],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            borderOnForeground: true,
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              onTap: () {
                Get.toNamed(Routes.MATA_PELAJARAN_PERKELAS,
                    arguments: {"kelas": "Kelas 3"});
              },
              title: const Text("Pelajaran Kelas 3"),
              trailing: const Icon(Icons.arrow_right),
              style: ListTileStyle.list,
              tileColor: Colors.blue[50],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            borderOnForeground: true,
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              onTap: () {
                Get.toNamed(Routes.MATA_PELAJARAN_PERKELAS,
                    arguments: {"kelas": "Kelas 4"});
              },
              title: const Text("Pelajaran Kelas 4"),
              trailing: const Icon(Icons.arrow_right),
              style: ListTileStyle.list,
              tileColor: Colors.blue[50],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            borderOnForeground: true,
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              onTap: () {
                Get.toNamed(Routes.MATA_PELAJARAN_PERKELAS,
                    arguments: {"kelas": "Kelas 5"});
              },
              title: const Text("Pelajaran Kelas 5"),
              trailing: const Icon(Icons.arrow_right),
              style: ListTileStyle.list,
              tileColor: Colors.blue[50],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            borderOnForeground: true,
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              onTap: () {
                Get.toNamed(Routes.MATA_PELAJARAN_PERKELAS,
                    arguments: {"kelas": "Kelas 6"});
              },
              title: const Text("Pelajaran Kelas 6"),
              trailing: const Icon(Icons.arrow_right),
              style: ListTileStyle.list,
              tileColor: Colors.blue[50],
            ),
          ),
        ],
      ),
    );
  }
}
