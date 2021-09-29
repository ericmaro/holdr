import 'package:card_app/pages/cards_page/active_cards.dart';
import 'package:card_app/pages/cards_page/controllers/card_binding.dart';
import 'package:card_app/pages/splash_page/index.dart';
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
      page: () => ActiveCards(),
      binding: CardBinding()
    ),
  ];
}
