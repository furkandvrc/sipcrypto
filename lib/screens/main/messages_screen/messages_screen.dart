import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/messages_controller.dart';
import 'view/messages.dart';


class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MessagesController(),
      builder: (GetxController controller) {
        return const Messages();
      },
    );
  }
}
