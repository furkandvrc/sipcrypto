import 'package:flutter/material.dart';
import 'package:cryptalone/app/constants/assets/assets.dart';
import 'package:get/get.dart';

import '../view/bottom_bar_item.dart';

class BottomBarController extends GetxController {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final RxInt _selectedIndex = 1.obs;

  ///BottomNavigationBar için kullanılan index
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int value) {
    if (_selectedIndex.value != value) _selectedIndex.value = value;
  }

  List<BottomNavigationBarItem> bottomNavigationBarItems(BuildContext context) {
    return [
      BottomNavigationBarItems(
        const Key('bottomPremiumKey'),
        label: 'Premium',
        isSelected: selectedIndex == 0 ? true : false,
        selectedIcon: menuPremiumSelected,
        unSelectedIcon: menuPremiumUnselected,
      ).bottomNavigationBarItemWidget(),
      BottomNavigationBarItems(
        const Key('bottomRecentsKey'),
        label: 'Recents',
        isSelected: selectedIndex == 1 ? true : false,
        selectedIcon: menuRecentsSelected,
        unSelectedIcon: menuRecentsUnselected,
      ).bottomNavigationBarItemWidget(),
      BottomNavigationBarItems(
        const Key('bottomMessagesKey'),
        label: 'Messages',
        isSelected: selectedIndex == 2 ? true : false,
        selectedIcon: menuMessagesSelected,
        unSelectedIcon: menuMessagesUnselected,
      ).bottomNavigationBarItemWidget(),
    ];
  }
}
