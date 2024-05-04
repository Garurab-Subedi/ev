import 'package:ev/app/utils/baseurl.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OtpController extends GetxController {
  final otpController =
      TextEditingController(); // Controller for OTP input field

  void verifyOtp() async {
    final otp = otpController.text;
    if (otp.length != 4) {
      // Check if OTP is valid (4 digits)
      Get.snackbar('Error', 'Please enter a valid OTP',
          snackPosition: SnackPosition.TOP);
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('$baseurl/api/users/verify/$otp'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // OTP verification successful
        Get.snackbar('Success', 'OTP verified successfully',
            snackPosition: SnackPosition.TOP);
        // You can add further logic here, such as navigating to the next screen
      } else {
        // OTP verification failed
        Get.snackbar('Error', 'Failed to verify OTP',
            snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      print('Error verifying OTP: $e');
      Get.snackbar('Error', 'An error occurred while verifying OTP',
          snackPosition: SnackPosition.TOP);
    }
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}
