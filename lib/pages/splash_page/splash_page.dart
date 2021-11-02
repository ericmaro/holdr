import 'package:holdr/pages/splash_page/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Initializing...",
              style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(color: Theme.of(context).primaryColor,)
          ],
        ),
      ),
    );
  }
}