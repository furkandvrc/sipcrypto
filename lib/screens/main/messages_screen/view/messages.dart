import 'package:flutter/material.dart';
import 'package:cryptalone/app/constants/assets/assets.dart';
import 'package:cryptalone/app/constants/other/padding_and_radius_size.dart';
import 'package:cryptalone/app/extensions/widgets_scale_extension.dart';
import 'package:cryptalone/app/theme/color/app_colors.dart';
import 'package:cryptalone/screens/main/messages_screen/controller/messages_controller.dart';
import '../../../../app/theme/text_style/text_style.dart';
import 'package:get/get.dart';

part '../components/message_header.dart';
part '../components/message_box.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MessagesController>();
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.horizontalScale),
          child: Image.asset(
            crpytAloneLogo,
            scale: 5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: paddingXS, vertical: paddingL),
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(children: [
            const MessageHeader(),
            SizedBox(height: 10.verticalScale),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.messageList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Obx(() => GestureDetector(
                        onTap: () {
                          controller.messageList[index].isRead = false;

                          controller.goToMessageDetailScreen(
                            controller.messageList[index].userName,
                            controller.messageList[index].phoneNumber,
                          );
                        },
                        child: MessagesBox(
                          isRead: controller.messageList[index].isRead,
                          messageTime: controller.messageList[index].timestamp,
                          unreadCount: controller.messageList[index].unreadCount,
                          messages: controller.messageList[index].message,
                          name: controller.messageList[index].userName,
                          phoneNumber: controller.messageList[index].phoneNumber,
                          isSent: controller.messageList[index].isSent,
                        ),
                      )),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
