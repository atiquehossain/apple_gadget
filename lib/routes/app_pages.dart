import 'package:get/get.dart';

import '../buinding/LastFourDigit_binding.dart';
import '../buinding/accountInfo/accountInfo_binding.dart';
import '../buinding/home_binding.dart';
import '../buinding/login_binding.dart';
import '../buinding/splash_binding.dart';
import '../controllers/LastFourDigitController.dart';
import '../views/LastFourDigit/LastFourDigitView.dart';
import '../views/accountInfo/AccountInfoPage.dart';
import '../views/authentication/LoginPageView.dart';
import '../views/home/home_view.dart';
import '../views/authentication/splash_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
     GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
     GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginPageView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNTINFO,
      page: () => const AccountInfoPage(),
      binding: AccountInfoBinding(),
    ),
    GetPage(
      name: _Paths.LASTFOURDIGIT,
      page: () =>  LastFourDigitView(),
      binding: LastFourDigit_binding() ,
    ),
  ];
}
