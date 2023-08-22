import 'package:get/get.dart';

import '../controllers/check_sign_controller.dart';

class CheckSignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckSignController>(
      () => CheckSignController(),
    );
  }
}
