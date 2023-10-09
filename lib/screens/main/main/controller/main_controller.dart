import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cryptalone/app/navigation/route/route.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<bool> onWillScope() async {
    String? currentPath;
    navigatorKey.currentState?.popUntil((route) {
      currentPath = route.settings.name;

      return true;
    });

    if (currentPath != MainScreensEnum.recentsScreen.path) {
      navigatorKey.currentState!.maybePop();

      return false;
    } else {
      return true;
    }
  }
}
