import 'package:get/get.dart';

import '../buinding/GetOpenTrades/GetOpenTrades_binding.dart';
import '../buinding/lastfourDigit/LastFourDigit_binding.dart';
import '../buinding/accountInfo/accountInfo_binding.dart';
import '../buinding/home/home_binding.dart';
import '../buinding/login/login_binding.dart';
import '../buinding/splash/splash_binding.dart';
import '../views/GetOpenTrades/GetOpenTradesView.dart';
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
    ),  GetPage(
      name: _Paths.GETOPENTRADES,
      page: () =>  GetOpenTradesView(),
      binding: GetOpenTradesBinding() ,
    ),
  ];
}
