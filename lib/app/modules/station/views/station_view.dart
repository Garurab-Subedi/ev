import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/station_controller.dart';

// ignore: must_be_immutable
class StationView extends GetView<StationController> {
  StationView({Key? key}) : super(key: key);

  var stationController = Get.put(StationController());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // body: Obx(() => stationController.isLoading.value
        //     ? const Center(child: CircularProgressIndicator())
        //     : ListView.builder(
        //         itemCount: stationController.stationList.length,
        //         itemBuilder: (context, index) {
        //           // return const StationList(
        //           //     // item: stationController.stationList[index],
        //           //     );
        //           return const Text("data");
        //         },
        //       )),
        );
  }
}
