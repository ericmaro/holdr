import 'package:card_app/pages/pin_page/services/pin_service.dart';
import 'package:card_app/pages/splash_page/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<SplashController>(
      init: controller.initApp(),
      builder: (_) => Center(
        child: Text("Splash"),
      ),
    ));
  }
}
// SizedBox(
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: Image.asset('assets/icons/icon.png'),
//           ),
//           width: 100,
//         )