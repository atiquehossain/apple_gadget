import 'package:apple_gadget/views/GetOpenTrades/GetOpenTradesView.dart';
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
    Get.toNamed(Routes.ACCOUNTINFO);
  }

  lastFourDigitPage() {
    Get.toNamed(Routes.LASTFOURDIGIT);
  }

  getOpenTradesPage() {
    Get.toNamed(Routes.GETOPENTRADES);
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
