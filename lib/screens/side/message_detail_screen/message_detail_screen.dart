import 'package:cryptalone/screens/side/message_detail_screen/view/message_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/constants/enum/arguments_enum.dart';
import 'controller/message_detail_controller.dart';

class MessageDetailScreen extends StatelessWidget {
  const MessageDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<MessageScreenArgumentEnum, dynamic>;
    return GetBuilder(
      init: MessageDetailController(phoneNumber: arguments[MessageScreenArgumentEnum.phoneNumber], userName: arguments[MessageScreenArgumentEnum.userName]),
      builder: (GetxController controller) {
        return const MessageDetail();
      },
    );
  }
}
