import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../controllers/LastFourDigitController.dart';

class LastFourDigit_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LastFourDigitController>(
          () => LastFourDigitController(),
    );
  }
}