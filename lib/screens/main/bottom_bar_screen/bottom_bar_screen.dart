import 'package:flutter/material.dart';
import 'package:cryptalone/app/extensions/widgets_scale_extension.dart';
import 'package:get/get.dart';

import '../../../app/theme/text_style/text_style.dart';
import 'controller/bottom_bar_controller.dart';

class BottomBar extends StatefulWidget {
  final Function(int) onTap;
  const BottomBar({Key? key, required this.onTap}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        return;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavigationBarCont = Get.find<BottomBarController>();

    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 3,
            enableFeedback: true,
            selectedFontSize: 12.horizontalScale,
            unselectedFontSize: 12.horizontalScale,
            backgroundColor: Theme.of(context).colorScheme.surface,
            //Index
            currentIndex: bottomNavigationBarCont.selectedIndex,
            onTap: (int value) => widget.onTap.call(value),

            ///Label
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: s14W600Dark,
            unselectedLabelStyle: s14W600Dark,

            ///Item
            unselectedItemColor: Theme.of(context).colorScheme.secondaryContainer,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            items: bottomNavigationBarCont.bottomNavigationBarItems(context),
          ),
        ],
      ),
    );
  }
}
