import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), (() {
      Get.offAllNamed(Routes.ONBOARDING);
    }));
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              'assets/images/logo.png',
            ),
          )),
        ),
      ),
    );
  }
}
