import 'dart:convert';
import 'package:ev/app/model/station.dart';
import 'package:ev/app/utils/baseurl.dart';
import 'package:ev/app/utils/shared_preds.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<RandomStation> stationList = RxList<RandomStation>();

  @override
  void onInit() {
    super.onInit();
    getStation();
  }

  Future<void> getStation() async {
    isLoading.value = true; // Set isLoading to true before making the request
    try {
      final response = await http.get(Uri.parse('$baseurl/api/stations'),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final data = Station.fromJson(json.decode(response.body));
        stationList.assignAll(data.randomStation ?? []);

        // Save the station IDs to local memory
        for (var station in stationList) {
          MemoryManagement.setStationID(station.stationId);
        }
      } else {
        print('Error: Unable to fetch stations data');
      }
    } catch (e) {
      print('Exception occurred: $e');
    } finally {
      isLoading.value = false; // Set isLoading to false
    }
  }
}
