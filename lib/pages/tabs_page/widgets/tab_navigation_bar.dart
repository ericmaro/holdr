import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:holdr/pages/tabs_page/controllers/tabs_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabNavigationBar extends GetWidget<TabsPageController> {
  const TabNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedBottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          icons: [Icons.credit_card, Icons.settings],
          activeIndex: controller.tabIndex.value,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          activeColor: Colors.white,
          inactiveColor: Colors.white.withOpacity(.3),
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (val) => controller.setTabIndex(val));
    });
  }
}
