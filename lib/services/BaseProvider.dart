import 'package:get/get_connect/connect.dart';

import 'ApiConstants.dart';
import 'networking/interceptors/RequestInterceptor.dart';
import 'networking/interceptors/ResponseInterceptor.dart';

class BaseProvider extends GetConnect{

  @override
  void onInit() {
    httpClient.baseUrl =  ApiConstants.baseUrl;
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
    super.onInit();
  }

}