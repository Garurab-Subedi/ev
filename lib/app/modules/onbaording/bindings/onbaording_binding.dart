import 'package:get/get.dart';

import '../controllers/onbaording_controller.dart';

class OnbaordingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnbaordingController>(
      () => OnbaordingController(),
    );
  }
}
