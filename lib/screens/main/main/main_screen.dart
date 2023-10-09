import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:cryptalone/app/navigation/route/route.dart';
import 'package:cryptalone/screens/main/bottom_bar_screen/bottom_bar_screen.dart';
import 'package:cryptalone/screens/main/bottom_bar_screen/controller/bottom_bar_controller.dart';
import 'package:get/get.dart';
import 'controller/main_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      autoRemove: false,
      builder: (controller) => WillPopScope(
        onWillPop: controller.onWillScope,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: GetBuilder<BottomBarController>(
              init: BottomBarController(),
              builder: (bottomNavigationBarController) {
                return Scaffold(
                  body: Obx(
                    () => PageTransitionSwitcher(
                      transitionBuilder: (
                        Widget child,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                      ) {
                        return FadeThroughTransition(
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          child: child,
                        );
                      },
                      child: bottomNavigationBarScreens[bottomNavigationBarController.selectedIndex],
                    ),
                  ),
                  bottomNavigationBar: BottomBar(
                    onTap: (int value) => setState(() => bottomNavigationBarController.selectedIndex = value),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
