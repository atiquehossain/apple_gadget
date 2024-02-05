import 'package:get/get.dart';

import '../../controllers/GetOpenTrades/GetOpenTradesController.dart';




class GetOpenTradesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetOpenTradesController>(
      () => GetOpenTradesController(),
    );
  }
}
