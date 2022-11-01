import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_pengumuman_controller.dart';

class ListPengumumanView extends GetView<ListPengumumanController> {
  const ListPengumumanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListPengumumanView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ListPengumumanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
