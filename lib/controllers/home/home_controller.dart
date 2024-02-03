import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../routes/app_pages.dart';

class HomeController extends GetxController {
  final getStorge = GetStorage();
  var name = "";

  @override
  void onInit() {
    super.onInit();
  }

  accountInfoPage() {
    Get.offAllNamed(Routes.ACCOUNTINFO);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
