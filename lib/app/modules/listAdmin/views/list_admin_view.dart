import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_admin_controller.dart';

class ListAdminView extends GetView<ListAdminController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListAdminView'),
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
