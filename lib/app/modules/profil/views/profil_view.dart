import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sikadu_admin/app/controllers/auth_c_controller.dart';
import 'package:sikadu_admin/app/routes/app_pages.dart';
import 'package:sikadu_admin/app/widget/buttonW.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  final AuthC = Get.put(AuthCController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                width: 180,
                height: 180,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Lottie.asset(
                    "assets/lottie/avatar.json",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Text(
                "Hana Hummaira",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "5180411366",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          // Card(
          //   margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          //   borderOnForeground: true,
          //   color: Colors.white,
          //   elevation: 2,
          //   child: ListTile(
          //     style: ListTileStyle.list,
          //     onTap: () {},
          //     leading: const Icon(Icons.key_sharp),
          //     title: const Text("Ubah Password"),
          //     trailing: Icon(Icons.arrow_right),
          //   ),
          // ),
          // Card(
          //   margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          //   borderOnForeground: true,
          //   color: Colors.white,
          //   elevation: 2,
          //   child: ListTile(
          //     style: ListTileStyle.list,
          //     onTap: () {},
          //     leading: Icon(Icons.person_search_rounded),
          //     title: Text("Lihat Data Orang Tua"),
          //     trailing: Icon(Icons.arrow_right),
          //   ),
          // ),
          // Card(
          //   margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          //   borderOnForeground: true,
          //   color: Colors.white,
          //   elevation: 2,
          //   child: ListTile(
          //     style: ListTileStyle.list,
          //     onTap: () {},
          //     leading: Icon(Icons.personal_injury),
          //     title: Text("Wali Kelas"),
          //     trailing: Icon(Icons.arrow_right),
          //   ),
          // ),
          Card(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            borderOnForeground: true,
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              style: ListTileStyle.list,
              onTap: () {},
              leading: Icon(Icons.key),
              title: Text("Ganti Password"),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonW(
            onTap: () {
              Get.defaultDialog(
                onConfirm: () {
                  AuthC.logut();
                },
                textConfirm: "Logout",
                onCancel: () {
                  Get.back();
                },
                textCancel: "Tidak",
                confirmTextColor: Colors.white,
              );
            },
            text: "Logout",
          )
        ],
      ),
    );
  }
}
