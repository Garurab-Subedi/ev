import 'dart:convert';

import 'package:ev/app/utils/baseurl.dart';
import 'package:ev/app/utils/custom_snackbar.dart';
// Import the MemoryManagement class
import 'package:ev/app/utils/shared_preds.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BookingController extends GetxController {
  late TextEditingController startTimeController;
  late TextEditingController endTimeController;
  late TextEditingController arrivalTimeController;

  @override
  void onInit() {
    super.onInit();
    startTimeController = TextEditingController();
    endTimeController = TextEditingController();
    arrivalTimeController = TextEditingController();
  }

  @override
  void onClose() {
    startTimeController.dispose();
    endTimeController.dispose();
    arrivalTimeController.dispose();
    super.onClose();
  }

  void checkBooking(int selectedStationId, int selectedChargerId) {
    if (startTimeController.text.isEmpty || endTimeController.text.isEmpty) {
      customSnackbar("Error", "Start time and end time are required", "error");
    } else {
      Get.showOverlay(
        asyncFunction: () => addBooking(selectedStationId, selectedChargerId),
        loadingWidget: const CircularProgressIndicator(),
      );
    }
  }

  Future<void> addBooking(int selectedStationId, int selectedChargerId) async {
    var body = {
      "UserID": MemoryManagement.getUserID().toString(),
      "ChargerID": selectedChargerId.toString(),
      "stationId": selectedStationId.toString(),
      "StartTime": startTimeController.text,
      "EndTime": endTimeController.text,
      "ArrivalTime": arrivalTimeController.text,
    };

    var response = await http.post(
      Uri.parse('$baseurl/api/bookings'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    var res = jsonDecode(response.body);

    if (response.statusCode == 200) {
      customSnackbar('Success', res['message'], 'success');
    } else {
      customSnackbar('Error', res['message'], 'error');
    }
  }
}
