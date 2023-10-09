part of '../view/message_detail.dart';

class MessageSenderWidget extends StatelessWidget {
  const MessageSenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MessageDetailController>();
    return Obx(() => Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingXXS.verticalScale),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                          maxLength: 2000,
                          maxLines: controller.textEditingController.text.length < 30 ? 1 : 3,
                          controller: controller.textEditingController,
                          style: s15W300Dark,
                          decoration: InputDecoration(
                            counter: const SizedBox.shrink(),
                            prefixIcon: Material(
                                color: Colors.transparent,
                                child: IconButton(
                                  onPressed: () => controller.emojiShowing = !controller.emojiShowing,
                                  icon: Icon(
                                    controller.emojiShowing ? Icons.keyboard : Icons.emoji_emotions,
                                    color: AppColors.primary,
                                  ),
                                )),
                            hintText: 'Type a message',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100.0),
                              borderSide: BorderSide.none,
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 10.verticalScale,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(100.0),
                      color: AppColors.primary,
                      child: IconButton(
                          onPressed: () {
                            controller.sendMessage(controller.textEditingController.text, "furkan", "doğan");
                          },
                          icon: Icon(
                            Icons.send,
                            color: AppColors.white,
                          )),
                    )
                  ],
                )),
            Obx(() => Offstage(
                  offstage: !controller.emojiShowing,
                  child: SizedBox(
                      height: 250,
                      child: EmojiPicker(
                        textEditingController: controller.textEditingController,
                        onBackspacePressed: controller.onBackspacePressed,
                        config: Config(
                          columns: 8,
                          emojiSizeMax: 30 * (Platform.isIOS ? 1.30 : 1.0),
                          verticalSpacing: 10,
                          horizontalSpacing: 0,
                          gridPadding: EdgeInsets.zero,
                          initCategory: Category.RECENT,
                          bgColor: AppColors.lightWhite,
                          indicatorColor: AppColors.primary,
                          iconColor: Colors.grey,
                          iconColorSelected: AppColors.primary,
                          backspaceColor: AppColors.primary,
                          skinToneDialogBgColor: Colors.white,
                          skinToneIndicatorColor: Colors.grey,
                          enableSkinTones: true,
                          recentTabBehavior: RecentTabBehavior.RECENT,
                          recentsLimit: 28,
                          replaceEmojiOnLimitExceed: false,
                          noRecents: Text('No Recents', style: s20W500Dark, textAlign: TextAlign.center),
                          loadingIndicator: const CircularProgressIndicator(),
                          tabIndicatorAnimDuration: kTabScrollDuration,
                          categoryIcons: const CategoryIcons(),
                          buttonMode: ButtonMode.MATERIAL,
                          checkPlatformCompatibility: true,
                        ),
                      )),
                ))
          ],
        ));
  }
}
