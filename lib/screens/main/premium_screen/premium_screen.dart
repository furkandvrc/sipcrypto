import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/premium_controller.dart';
import 'view/premium.dart';


class PremiumScreen extends StatelessWidget {
  const PremiumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PremiumController(),
      builder: (GetxController controller) {
        return const Premium();
      },
    );
  }
}
