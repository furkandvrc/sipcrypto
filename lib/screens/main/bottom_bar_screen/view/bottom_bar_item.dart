import 'package:flutter/material.dart';
import 'package:cryptalone/app/constants/other/padding_and_radius_size.dart';
import 'package:cryptalone/app/extensions/widgets_scale_extension.dart';

class BottomNavigationBarItems {
  final Key? btnKey;
  final String selectedIcon;
  final String unSelectedIcon;
  final String label;
  final bool isSelected;

  const BottomNavigationBarItems(this.btnKey, {required this.selectedIcon, required this.label, required this.isSelected, required this.unSelectedIcon});

  BottomNavigationBarItem bottomNavigationBarItemWidget() {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: paddingXXXS),
        child: SizedBox.square(
          dimension: 24.horizontalScale,
          child: Image.asset(
            isSelected ? selectedIcon : unSelectedIcon,
            key: btnKey,
          ),
        ),
      ),
      label: label,
    );
  }
}
