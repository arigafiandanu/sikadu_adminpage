import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/daftar_controller.dart';

class DaftarView extends GetView<DaftarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DaftarView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DaftarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
