import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sikadu_admin/app/routes/app_pages.dart';

import '../controllers/list_guru_controller.dart';

class ListGuruView extends GetView<ListGuruController> {
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
          'List Guru',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamGuru(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            var listItem = snapshot.data!.docs;
            return ListView.builder(
              itemCount: listItem.length,
              itemBuilder: (context, index) {
                var dataItem = listItem[index].data() as Map<String, dynamic>;
                return Card(
                  margin: const EdgeInsets.all(5),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    onTap: () {
                      Get.toNamed(Routes.DETAIL_GURU, arguments: dataItem);
                    },
                    leading: CircleAvatar(
                      radius: 25,
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
          } else {
            return const Center(
              child: Text("data erro"),
            );
          }
        },
      ),
    );
  }
}
