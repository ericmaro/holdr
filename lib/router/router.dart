import 'package:get/get.dart';
import 'package:starter/pages/cards_page/active_cards.dart';
import 'package:starter/pages/cards_page/controllers/card_binding.dart';
import 'package:starter/pages/splash_page/index.dart';
import 'package:starter/shared/controllers/app_controllers/app_binding.dart';
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
