import 'package:card_app/pages/cards_page/active_cards.dart';
import 'package:card_app/pages/cards_page/controllers/card_binding.dart';
import 'package:card_app/pages/settings_page/controllers/settings_binding.dart';
import 'package:card_app/pages/splash_page/index.dart';
import 'package:card_app/pages/tabs_page/controllers/tabs_page_binding.dart';
import 'package:card_app/pages/tabs_page/tabs_page.dart';
import 'package:card_app/shared/controllers/app_controllers/app_binding.dart';
import 'package:get/get.dart';
class AppRouter {
  static var routes = [
    GetPage(
      name: '/splash',
      page: () => SplashPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: '/',
      page: () => TabsPage(),
      bindings: [TabsPageBinding(), CardBinding(), SettingsBinding()]
    ),
  ];
}
