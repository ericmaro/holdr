import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:card_app/pages/tabs_page/controllers/tabs_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabNavigationBar extends GetWidget<TabsPageController> {
  const TabNavigationBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return AnimatedBottomNavigationBar(
          backgroundColor: Colors.blue[800],
          icons: [Icons.credit_card, Icons.settings], 
          activeIndex: controller.tabIndex.value,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          activeColor: Colors.white,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (val) => controller.setTabIndex(val)
          );
      }
    );
  }
}