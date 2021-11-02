import 'package:holdr/router/router.dart';
import 'package:holdr/theme/theme.dart';
import 'package:holdr/theme/themeService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        navigatorKey: Get.key,
        locale: Get.deviceLocale,
        debugShowCheckedModeBanner: false,
        title: 'Holdr',
        theme: Themes().lightTheme,
        darkTheme: Themes().darkTheme,
        themeMode: ThemeService().theme,
        initialRoute: '/',
        getPages: AppRouter.routes);
  }
}
