import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_siswa_controller.dart';

class TambahSiswaView extends GetView<TambahSiswaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TambahSiswaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TambahSiswaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
