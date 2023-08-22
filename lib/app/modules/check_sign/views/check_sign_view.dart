import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/check_sign_controller.dart';

class CheckSignView extends GetView<CheckSignController> {
  const CheckSignView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckSignView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CheckSignView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
