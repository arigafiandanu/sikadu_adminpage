import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sikadu_admin/app/routes/app_pages.dart';

import '../../../style/textStyle.dart';
import '../../../widget/cardButtonW.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SafeArea(
              top: true,
              left: true,
              right: true,
              child: Container(),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Hallo, ibu xxxx",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Bagaimana kabar anak anda hari ini???",
                              style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        ClipOval(
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: AppColors.biruTerang,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Lottie.asset(
                              "assets/lottie/avatar.json",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Get.height * 0.75,
              width: Get.width,
              child: GridView.count(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                padding: const EdgeInsets.all(15),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  cardhomepage(
                    ontap: () {
                      Get.toNamed(Routes.BUAT_PENGUMUMAN);
                    },
                    warnaTerang: AppColors.grayshade,
                    warna: AppColors.lightblue,
                    icon: const Icon(
                      Icons.new_releases_outlined,
                      size: 35,
                    ),
                    kategori: "Pengumuman Baru",
                  ),
                  cardhomepage(
                    ontap: () {
                      Get.toNamed(Routes.TAMBAH_SISWA);
                    },
                    warnaTerang: AppColors.grayshade,
                    warna: AppColors.blue,
                    icon: Icon(
                      Icons.person_pin_circle,
                      size: 35,
                    ),
                    kategori: "Tambah Siswa",
                  ),
                  cardhomepage(
                    ontap: () {
                      Get.toNamed(Routes.TAMBAH_GURU);
                    },
                    warnaTerang: AppColors.grayshade,
                    warna: AppColors.blue,
                    icon: Icon(
                      Icons.co_present_outlined,
                      size: 35,
                    ),
                    kategori: "Tambah Guru",
                  ),
                  cardhomepage(
                    ontap: () {
                      Get.toNamed(Routes.KELOLA_GURU);
                    },
                    warnaTerang: AppColors.grayshade,
                    warna: AppColors.blue,
                    icon: const Icon(
                      Icons.lock_person,
                      size: 35,
                    ),
                    kategori: "Kelola Data Guru",
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width,
              height: Get.height / 3,
              color: Colors.grey[100],
              child: Center(
                child: Text("Pengumuman"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
