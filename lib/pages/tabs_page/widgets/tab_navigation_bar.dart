import 'package:card_app/pages/tabs_page/controllers/tabs_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabNavigationBar extends GetWidget<TabsPageController> {
  const TabNavigationBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return BottomNavigationBar(
          backgroundColor: Colors.grey[200],
          elevation: 0,
          currentIndex: controller.tabIndex.value,
          onTap: (val) => controller.setTabIndex(val),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              activeIcon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Home',
              activeIcon: Icon(Icons.settings)
            ),
          ],
        );
      }
    );
  }
}