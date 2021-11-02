import 'package:holdr/pages/cards_page/active_cards.dart';
import 'package:holdr/pages/cards_page/widgets/add_card_button.dart';
import 'package:holdr/pages/settings_page/settings_page.dart';
import 'package:holdr/pages/tabs_page/controllers/tabs_page_controller.dart';
import 'package:holdr/pages/tabs_page/widgets/tab_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsPage extends GetWidget<TabsPageController> {
  TabsPage({Key? key}) : super(key: key);

  final List<Widget> _tabsPage = [ActiveCards(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
          color: Colors.blue[800],
          child: Obx(() => _tabsPage[controller.tabIndex.value])),
      bottomNavigationBar: TabNavigationBar(),
      floatingActionButton: AddCardButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
