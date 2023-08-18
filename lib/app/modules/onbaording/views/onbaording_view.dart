import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onbaording_controller.dart';

class OnbaordingView extends GetView<OnbaordingController> {
  const OnbaordingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnbaordingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OnbaordingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
