import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sikadu_admin/app/routes/app_pages.dart';

import '../controllers/list_pengumuman_controller.dart';

class ListPengumumanView extends GetView<ListPengumumanController> {
  const ListPengumumanView({Key? key}) : super(key: key);
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
          'Daftar Pengumuman',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamPengumuman(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            var data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var isiData = data[index].data() as Map<String, dynamic>;
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.DETAIL_PENGUMUMAN,
                          arguments: isiData,
                        );
                      },
                      borderRadius: BorderRadius.circular(10),
                      focusColor: Colors.green[100],
                      splashColor: Colors.green[150],
                      child: Container(
                        width: Get.width,
                        height: Get.height * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade100),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                isiData['kategori'],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              alignment: Alignment.centerLeft,
                              width: Get.width * 0.8,
                              height: Get.height * 0.075,
                              child: Text(
                                isiData['judul'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                isiData['tanggalBuat'],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text("data error"),
            );
          }
        },
      ),
    );
  }
}
