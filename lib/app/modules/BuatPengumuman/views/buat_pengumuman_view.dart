import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/buat_pengumuman_controller.dart';

class BuatPengumumanView extends GetView<BuatPengumumanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BuatPengumumanView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BuatPengumumanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
