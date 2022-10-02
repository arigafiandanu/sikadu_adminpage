import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kelola_guru_controller.dart';

class KelolaGuruView extends GetView<KelolaGuruController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KelolaGuruView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'KelolaGuruView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
