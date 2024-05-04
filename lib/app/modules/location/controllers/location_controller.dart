import 'dart:convert';

import 'package:ev/app/routes/app_pages.dart';
import 'package:ev/app/utils/baseurl.dart';
import 'package:ev/app/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LocationController extends GetxController {
  late TextEditingController locationNameController,
      latitudeController,
      longitudeController;

  @override
  void onInit() {
    super.onInit();
    locationNameController = TextEditingController();
    latitudeController = TextEditingController();
    longitudeController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    locationNameController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
  }

  Future<void> addLocation() async {
    // Create request payload
    final requestBody = {
      "LocationName": locationNameController.text,
      "Latitude": double.tryParse(latitudeController.text),
      "Longitude": double.tryParse(longitudeController.text),
    };

    // Send POST request
    final response = await http.post(
      Uri.parse('$baseurl/api/location'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    final res = json.decode(response.body);

    if (response.statusCode == 200) {
      customSnackbar('Success', res['message'], 'success');
      Get.offAllNamed(Routes.HOME);
    } else {
      customSnackbar('Error', res['message'], 'error');
    }
  }
}
