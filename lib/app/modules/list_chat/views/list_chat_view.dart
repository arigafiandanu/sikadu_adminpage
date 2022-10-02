import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sikadu_admin/app/routes/app_pages.dart';

import '../controllers/list_chat_controller.dart';

class ListChatView extends GetView<ListChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Material(
            elevation: 5,
            child: Container(
              margin: EdgeInsets.only(top: context.mediaQueryPadding.top),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(96, 161, 161, 161),
                  ),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Pesan Masuk",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(30),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(30),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.delete_sweep_rounded,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(5),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    onTap: () {
                      Get.toNamed(Routes.CHAT);
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      child: ClipRect(
                        child: Lottie.asset(
                          "assets/lottie/avatar.json",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text("Nama ke $index"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
