import 'dart:convert';
import 'package:ev/app/routes/app_pages.dart';
import 'package:ev/app/utils/baseurl.dart';
import 'package:ev/app/utils/custom_snackbar.dart';
import 'package:ev/app/utils/shared_preds.dart';

import 'package:ev/app/widgets/Loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LogInController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void checkLogin() {
    if (emailController.text.isEmpty ||
        !GetUtils.isEmail(emailController.text)) {
      customSnackbar("Error", "Valid email is required", "error");
    } else if (passwordController.text.isEmpty) {
      customSnackbar("Error", "Password is required", "error");
    } else {
      Get.showOverlay(
        asyncFunction: () => login(),
        loadingWidget: const Loader(),
      );
    }
  }

  Future<void> login() async {
    try {
      final response = await http.post(
        Uri.parse('$baseurl/api/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": emailController.text,
          "password": passwordController.text,
        }),
      );

      final res = jsonDecode(response.body);
      print(res);

      if (response.statusCode == 200) {
        // Check if UserID exists in the response and is not null
        if (res['userdetails'] != null &&
            res['userdetails']['UserID'] != null) {
          MemoryManagement.setUserID(res['userdetails']['UserID']);
        } else {
          // Handle the case where UserID is null or not present in the response
          print('UserID not found in response');
        }
        MemoryManagement.setToken(res['token']);

        customSnackbar('Success', 'Login successful!', 'success');
        Get.offAllNamed(Routes.HOME);
      } else {
        customSnackbar('Error', res['message'], 'error');
      }
    } catch (e) {
      customSnackbar('Error', 'Failed to login. Please try again.', 'error');
    }
  }

  Future<void> logout() async {
    MemoryManagement.removeAll();
    Get.offAllNamed(
        Routes.SPLASH_SCREEN); // Navigate to splash screen after logout
  }
}
