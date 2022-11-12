import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/list_admin_controller.dart';

class ListAdminView extends GetView<ListAdminController> {
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
          'List Admin',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.steamAdmin(),
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
                    onTap: () {},
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
