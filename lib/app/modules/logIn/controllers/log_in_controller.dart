import 'dart:convert';

import 'package:ev/app/routes/app_pages.dart';
import 'package:ev/app/utils/baseurl.dart';
import 'package:ev/app/utils/custom_snackbar.dart';
import 'package:ev/app/widgets/Loader.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LogInController extends GetxController {
  late TextEditingController emailController, passwordController;

  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();

    emailController.dispose();
    passwordController.dispose();
  }

  checklogin() {
    if (emailController.text.isEmpty ||
        GetUtils.isEmail(emailController.text) == false) {
      customSnackbar("Error", "email is required", "error");
    } else if (passwordController.text.isEmpty) {
      customSnackbar("Error", "password is required", "error");
    } else {
      Get.showOverlay(
          asyncFunction: () => login(), loadingWidget: const Loader());
    }
  }

  login() async {
    var response = await http.post(Uri.parse('${baseurl}api/auth/login'),
        body: {
          "email": emailController.text,
          "password": passwordController.text
        });
    var res = await json.decode(response.body);

    if (res != null && res['success'] != null && res['success']) {
      customSnackbar('Sucess', res['message'], 'success');
      Get.offAllNamed(Routes.HOME);
    } else {
      customSnackbar('Error', res['message'], 'error');
    }
  }
}
