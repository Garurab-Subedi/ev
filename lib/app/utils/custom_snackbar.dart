import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customSnackbar(String title, String message, String type) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: type == "error" ? Colors.red : Colors.green,
    colorText: Colors.white,
  );
}
