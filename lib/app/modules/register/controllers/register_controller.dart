import 'dart:convert';

import 'package:ev/app/routes/app_pages.dart';
import 'package:ev/app/utils/baseurl.dart';
import 'package:ev/app/utils/custom_snackbar.dart';
import 'package:ev/app/widgets/Loader.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  late TextEditingController usernameController,
      emailController,
      passwordController;

  @override
  void onInit() {
    super.onInit();

    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();

    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void checkRegister() {
    if (usernameController.text.isEmpty) {
      customSnackbar("Error", "Name is required", "error");
    } else if (emailController.text.isEmpty ||
        GetUtils.isEmail(emailController.text) == false) {
      customSnackbar("Error", "email is required", "error");
    } else if (passwordController.text.isEmpty) {
      customSnackbar("Error", "password is required", "error");
    } else {
      Get.showOverlay(
          asyncFunction: () => register(), loadingWidget: const Loader());
    }
  }

  register() async {
    try {
      var response =
          await http.post(Uri.parse('${baseurl}api/auth/register'), body: {
        "username": usernameController.text,
        "email": emailController.text,
        "password": passwordController.text
      });

      var res = await jsonDecode(response.body);

      if (res != null && res['success'] != null && res['success']) {
        customSnackbar('Sucess', res['message'], 'success');
        Get.offAllNamed(Routes.LOG_IN);
      } else {
        customSnackbar('Error', res['message'], 'error');
      }
    } catch (e) {
      print('error: $e');
    }
  }
}
