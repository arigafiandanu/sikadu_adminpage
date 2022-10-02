import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_chat_controller.dart';

class ListChatView extends GetView<ListChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListChatView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ListChatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
