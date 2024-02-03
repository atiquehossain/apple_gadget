import 'package:get/get.dart';

import '../../controllers/accountInfo/AccountController.dart';



class AccountInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
  }
}
