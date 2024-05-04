import 'package:get/get.dart';

import '../controllers/nearest_location_controller.dart';

class NearestLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NearestLocationController>(
      () => NearestLocationController(),
    );
  }
}
