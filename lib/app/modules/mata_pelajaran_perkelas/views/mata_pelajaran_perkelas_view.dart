import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mata_pelajaran_perkelas_controller.dart';

class MataPelajaranPerkelasView
    extends GetView<MataPelajaranPerkelasController> {
  const MataPelajaranPerkelasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MataPelajaranPerkelasView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MataPelajaranPerkelasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
