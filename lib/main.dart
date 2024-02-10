import 'package:apple_gadget/localization/Languages.dart';
import 'package:apple_gadget/routes/app_pages.dart';
import 'package:apple_gadget/themes/Themes.dart';
import 'package:apple_gadget/views/authentication/LoginPageView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/theme/ThemesController.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemesController themeController = Get.put(ThemesController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //themes
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: getThemeMode(themeController.theme),
      //routes
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      //localization
      locale: Locale('en','US'),
      //locale: _getLocale(),
      fallbackLocale: Locale('en','US'),
      translations: Languages(),
    );
  }

  ThemeMode getThemeMode(String type) {
    ThemeMode themeMode = ThemeMode.system;
    switch (type) {
      case "system":
        themeMode = ThemeMode.system;
        break;
      case "dark":
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.light;
        break;
    }

    return themeMode;
  }



  Locale _getLocale() {
    final storedLocale = GetStorage().read('locale');
    if (storedLocale != null) {
      return Locale(storedLocale['languageCode'], storedLocale['countryCode']);
    } else {
      return Locale('en', 'US'); // Default to English if no saved locale found
    }
  }
  void _changeLanguage(Locale locale) {
    Get.updateLocale(locale);
    GetStorage().write('locale', {
      'languageCode': locale.languageCode,
      'countryCode': locale.countryCode,
    });
  }
}
