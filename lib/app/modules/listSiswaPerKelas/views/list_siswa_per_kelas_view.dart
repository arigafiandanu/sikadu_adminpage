import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_siswa_per_kelas_controller.dart';

class ListSiswaPerKelasView extends GetView<ListSiswaPerKelasController> {
  const ListSiswaPerKelasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListSiswaPerKelasView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ListSiswaPerKelasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
