import 'dart:convert';

import 'package:apple_gadget/routes/app_pages.dart';
import 'package:apple_gadget/services/ApiConstants.dart';
import 'package:apple_gadget/shared/common/CommonWidget.dart';
import 'package:get_storage/get_storage.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _client = GetConnect();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  var error = ''.obs;

  var base_url = ApiConstants.baseUrl;
  var isPasswordVisible = true.obs;

  var endpoint = "IsAccountCredentialsCorrect";
  final getStorage = GetStorage();


  @override
  void onInit() {
    super.onInit();


  }


  Future<void> isAccountCredentialsCorrect() async {
    try {
      final response = await _client.post(base_url + endpoint, {
        "login": emailController.text.toString(),
        "password": passwordController.text.toString()
      });

      if (response.statusCode == 200) {
        print(response.body);
        CommonWidgets.showSuccessToast('Success', 'Login successful');

        getStorage.write("storedLoginStatus", 1);
        getStorage.write("login", emailController.text.toString());
        getStorage.write('requiresAuthToken', response.body['token']);
        Get.offAllNamed(Routes.HOME);
      } else {
        print(response.statusCode.toString());
        error.value = 'Invalid credential';
        CommonWidgets.snackBar('error', 'Invalid credential');
      }
      isLoading.value = false;
    } catch (e) {
      error.value = 'Failed to connect to server';
      print(error.value.toString());
      CommonWidgets.snackBar('error', 'Failed to connect to the server');
      isLoading.value = false;
    }
  }
}
