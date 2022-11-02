import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sikadu_admin/app/routes/app_pages.dart';

import '../controllers/list_siswa_controller.dart';

class ListSiswaView extends GetView<ListSiswaController> {
  const ListSiswaView({Key? key}) : super(key: key);
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
          'List Siswa',
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
                Get.toNamed(
                  Routes.LIST_SISWA_PER_KELAS,
                  arguments: {"id": "kelas 1"},
                );
              },
              title: const Text("Siswa Kelas 1"),
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
                Get.toNamed(
                  Routes.LIST_SISWA_PER_KELAS,
                  arguments: {"id": "kelas 2"},
                );
              },
              title: const Text("Siswa Kelas 2"),
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
                Get.toNamed(
                  Routes.LIST_SISWA_PER_KELAS,
                  arguments: {"id": "kelas 3"},
                );
              },
              title: const Text("Siswa Kelas 3"),
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
                Get.toNamed(
                  Routes.LIST_SISWA_PER_KELAS,
                  arguments: {"id": "kelas 4"},
                );
              },
              title: const Text("Siswa Kelas 4"),
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
                Get.toNamed(
                  Routes.LIST_SISWA_PER_KELAS,
                  arguments: {"id": "kelas 5"},
                );
              },
              title: const Text("Siswa Kelas 5"),
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
                Get.toNamed(
                  Routes.LIST_SISWA_PER_KELAS,
                  arguments: {"id": "kelas 6"},
                );
              },
              title: const Text("Siswa Kelas 6"),
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
