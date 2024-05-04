import 'package:get/get.dart';

import '../controllers/station_details_controller.dart';

class StationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StationDetailsController>(
      () => StationDetailsController(),
    );
  }
}
