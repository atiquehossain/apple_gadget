import 'package:get/get_connect/connect.dart';

import 'ApiConstants.dart';

class BaseProvider extends GetConnect{

  @override
  void onInit() {
    httpClient.baseUrl =  ApiConstants.baseUrl;
    super.onInit();
  }

}