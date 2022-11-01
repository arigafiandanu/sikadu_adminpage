import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_pengumuman_controller.dart';

class DetailPengumumanView extends GetView<DetailPengumumanController> {
  const DetailPengumumanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPengumumanView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailPengumumanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
