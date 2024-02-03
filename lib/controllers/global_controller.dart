import 'package:get/get.dart';

import 'theme/ThemesController.dart';
import 'login_controller.dart';

class Global {
  static Future<void> init() async {

    Get.lazyPut(() => LoginController());
  }
}
