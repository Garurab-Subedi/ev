import 'dart:convert';
import 'package:ev/app/model/chager.dart';
import 'package:ev/app/utils/baseurl.dart';
import 'package:ev/app/utils/shared_preds.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// Update the import path as necessary

class StationDetailsController extends GetxController {
  var isLoading = false.obs; // Observable flag for loading state
  var chagerDetails =
      Rx<Chagerdetails?>(null); // Observable variable for charger details

  // Backend URL
  final String backendUrl = '$baseurl/api/chagers/';

  // Method to fetch chager details from the backend URL
  Future<void> fetchChagerDetails() async {
    try {
      isLoading.value = true; // Set loading state to true
      final response =
          await http.get(Uri.parse(backendUrl)); // Make HTTP GET request

      // Check if the response is successful
      if (response.statusCode == 200) {
        // Parse the JSON response and assign it to chagerDetails
        chagerDetails.value = chagerdetailsFromJson(response.body);
        // Save the charger ID to local memory
        // Save the charger IDs to local memory
        for (var charger in chagerDetails.value!.chargers!) {
          MemoryManagement.setChargerID(charger.chargerId);
        }
      } else {
        // Handle non-successful response
        print(
            'Failed to fetch chager details. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors that occur during the fetch
      print('Error fetching chager details: $e');
    } finally {
      isLoading.value = false; // Set loading state to false
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchChagerDetails(); // Fetch charger details when the controller is initialized
  }
}
