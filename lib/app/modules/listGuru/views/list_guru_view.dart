import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_guru_controller.dart';

class ListGuruView extends GetView<ListGuruController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'List Guru',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ListGuruView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
