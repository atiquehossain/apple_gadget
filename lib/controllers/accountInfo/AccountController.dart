import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../services/ApiConstants.dart';

class AccountController extends GetxController {
  var accountInfo = {}.obs;

  final _client = GetConnect();
  var base_url = ApiConstants.baseUrl;
  var isPasswordVisible = true.obs;

  var endpoint = "GetAccountInformation";
  var error = ''.obs;




  final getStorage = GetStorage();

  int? loginAsInt;
  String? requiresAuthToken;

  void onInit() {
    super.onInit();
    //loginAsInt = getStorage.read('login');
    requiresAuthToken = getStorage.read('requiresAuthToken');
   // loginAsInt = getStorage.read('login');



    fetchAccountInformation();
  }

  Future<void> fetchAccountInformation() async {
    final requestBody = '{"login": 2088888, "token": "${requiresAuthToken}"}';

    try {


      final response = await _client.post(
        base_url+endpoint,  requestBody);

      print("Response StatusCode: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        accountInfo.value = response.body;
        print("Account Information loaded successfully");
      } else {
        throw Exception("Failed to load account information");
      }
    } catch (e) {
      // Log any exceptions
      error.value = 'Failed to connect to server';
      print("Exception: $e");
    }
  }


}


