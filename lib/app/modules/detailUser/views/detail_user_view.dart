import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_user_controller.dart';

class DetailUserView extends GetView<DetailUserController> {
  const DetailUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailUserView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailUserView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
