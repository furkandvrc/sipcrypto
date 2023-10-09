import 'dart:io';

import 'package:cryptalone/app/constants/other/padding_and_radius_size.dart';
import 'package:cryptalone/app/extensions/widgets_scale_extension.dart';
import 'package:cryptalone/app/theme/color/app_colors.dart';
import 'package:cryptalone/app/theme/text_style/text_style.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/message_detail_controller.dart';

part '../components/message_sender_widget.dart';

class MessageDetail extends StatelessWidget {
  const MessageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MessageDetailController>();
    return Scaffold(
        extendBody: true,
        key: controller.scaffoldKey,
        appBar: AppBar(
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Navigator.pop(context)),
          centerTitle: false,
          title: SizedBox(
            width: 330.verticalScale,
            child: Row(
              children: [
                Flexible(
                  flex: 7,
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    text: TextSpan(
                      text: "${controller.userName ?? ""} ${controller.phoneNumber == null ? "" : "(+${controller.phoneNumber ?? ""})"}",
                      style: s11W600Dark.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.videocam, color: AppColors.white)),
                IconButton(onPressed: () {}, icon: Icon(Icons.phone, color: AppColors.white)),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: AppColors.white))
              ],
            ),
          ),
        ),
        body: Column(children: [
          Obx(() {
            return Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: controller.scrollController,
                      itemCount: controller.messageList.length,
                      itemBuilder: (context, index) {
                        final message = controller.messageList[index];
                        return Container(
                          alignment: message.isSent ? Alignment.centerRight : Alignment.centerLeft,
                          child: ListTile(
                            title: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: message.isSent ? Colors.blue : Colors.green,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(
                                message.text,
                                style: const TextStyle(color: Colors.white), // Metin rengini beyaz yapabilirsiniz.
                              ),
                            ),
                            trailing: Text(message.timestamp),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10.verticalScale),
                  const MessageSenderWidget(),
                  const SizedBox(height: 30),
                ],
              ),
            );
          })
        ]));
  }
}
