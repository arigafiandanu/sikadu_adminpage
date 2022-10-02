import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_guru_controller.dart';

class TambahGuruView extends GetView<TambahGuruController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TambahGuruView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TambahGuruView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
