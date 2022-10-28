import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/daftar_pelajaran_controller.dart';

class DaftarPelajaranView extends GetView<DaftarPelajaranController> {
  const DaftarPelajaranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DaftarPelajaranView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DaftarPelajaranView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
