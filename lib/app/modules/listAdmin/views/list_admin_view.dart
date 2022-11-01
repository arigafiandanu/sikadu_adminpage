import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_admin_controller.dart';

class ListAdminView extends GetView<ListAdminController> {
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
          'List Admin',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ListAdminView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
