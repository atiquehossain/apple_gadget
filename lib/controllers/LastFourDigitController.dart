import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../services/ApiConstants.dart';

class LastFourDigitController extends GetxController {
  var lastFourDigit = {}.obs;

  final _client = GetConnect();
  var base_url = ApiConstants.baseUrl;
  var isPasswordVisible = true.obs;

  var endpoint = "GetLastFourNumbersPhone";
  var error = ''.obs;

  final getStorage = GetStorage();

  var loginAsInt;
  String? requiresAuthToken;

  void onInit() {
    super.onInit();
    requiresAuthToken = getStorage.read('requiresAuthToken');
    loginAsInt = getStorage.read('login');

    fetchLastFourDigit();
  }

  Future<void> fetchLastFourDigit() async {
    final requestBody = '{"login": ${loginAsInt}, "token": "${requiresAuthToken}"}';
    print("token:  "+requiresAuthToken.toString());

    try {
      final response = await _client.post(base_url + endpoint, requestBody);

      print("Response StatusCode: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final match = RegExp(r'\*+(\d+)').firstMatch(response.body);

        if (match != null) {
          final actualData = match.group(1);

          lastFourDigit.value = {'lastFourDigit': actualData};
        } else {
          throw Exception("Failed to extract actual data from the response");
        }
      } else {
        throw Exception("Failed to load account information");
      }
    } catch (e) {
      error.value = 'Failed to connect to the server';
      print("Exception: $e");
    }
  }
}