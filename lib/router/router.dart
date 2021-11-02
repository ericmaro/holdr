import 'package:holdr/pages/cards_page/active_cards.dart';
import 'package:holdr/pages/cards_page/controllers/card_binding.dart';
import 'package:holdr/pages/pin_page/controller/pin_binding.dart';
import 'package:holdr/pages/pin_page/enter_pin_page.dart';
import 'package:holdr/pages/pin_page/pin_page.dart';
import 'package:holdr/pages/splash_page/controller/splash_binding.dart';
import 'package:holdr/pages/splash_page/splash_page.dart';

import 'package:holdr/pages/settings_page/controllers/settings_binding.dart';
import 'package:holdr/pages/tabs_page/controllers/tabs_page_binding.dart';
import 'package:holdr/pages/tabs_page/tabs_page.dart';
import 'package:get/get.dart';

class AppRouter {
  static var routes = [
    GetPage(
      name: '/',
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: '/pin',
      page: () => PinPage(),
      binding: PinBinding(),
    ),
    GetPage(
      name: '/enter-pin',
      page: () => EnterPinPage(),
      binding: PinBinding(),
    ),
    GetPage(
        name: '/home',
        page: () => TabsPage(),
        bindings: [TabsPageBinding(), CardBinding(), SettingsBinding()]),
    GetPage(name: '/cards', page: () => ActiveCards(), binding: CardBinding()),
  ];
}
