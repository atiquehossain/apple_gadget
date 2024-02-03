import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/app_pages.dart';
import '../services/ApiConstants.dart';


class SplashController extends GetxController {
  final getStorage = GetStorage();


  var splash;


  void onReady() {
    super.onReady();
    if (getStorage.read("storedLoginStatus") != null) {
      Future.delayed(const Duration(milliseconds: 3000), () {
        Get.offAllNamed(Routes.HOME);
      });
    } else {

      Get.offAllNamed(Routes.LOGIN);
    }
  }







  @override
  void onClose() {
    super.onClose();
  }
}
