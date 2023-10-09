import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/recents_controller.dart';
import 'view/recents.dart';


class RecentsScreen extends StatelessWidget {
  const RecentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RecentsController(),
      builder: (GetxController controller) {
        return const Recents();
      },
    );
  }
}
