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
    print(loginAsInt.toString());



    fetchAccountInformation();
  }

  Future<void> fetchAccountInformation() async {
    try {
      final response = await _client.post(base_url + endpoint,
          {"login": 2088888, "password": requiresAuthToken});

      print("response.status: "+response.status.toString());

      if (response.statusCode == 200) {
        print("response.status: 200"+response.status.toString());
        accountInfo.value = response.body;
      } else {
        print("response.status 400 "+response.status.toString());

        throw Exception("Failed to load account information");
      }
    } catch (e) {
      error.value = 'Failed to connect to server';
    }
  }
}
