import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_guru_controller.dart';

class ListGuruView extends GetView<ListGuruController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListGuruView'),
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
