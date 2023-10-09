import 'package:cryptalone/app/constants/enum/cache_key_enum.dart';
import 'package:cryptalone/app/libs/locale_manager/locale_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/extensions/time_extension.dart';
import '../../../../app/model/response/message_detail_model.dart';

class MessageDetailController extends GetxController {
  final String userName;
  final String phoneNumber;

  final ScrollController scrollController = ScrollController();

  MessageDetailController({required this.userName, required this.phoneNumber}) : super();
  final TextEditingController textEditingController = TextEditingController();
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext get context => scaffoldKey.currentContext!;

  final RxBool _emojiShowing = false.obs;
  final RxString _receiverName = ''.obs;
  final RxList<MessageDetailModel> _messageList = <MessageDetailModel>[].obs;

  List<MessageDetailModel> get messageList => _messageList;
  set messageList(List<MessageDetailModel> value) => _messageList.value = value;

  bool get emojiShowing => _emojiShowing.value;
  set emojiShowing(bool value) => _emojiShowing.value = value;

  String get receiverName => _receiverName.value;
  set receiverName(String value) => _receiverName.value = value;

  onBackspacePressed() {
    textEditingController
      ..text = textEditingController.text.characters.toString()
      ..selection = TextSelection.fromPosition(TextPosition(offset: textEditingController.text.length));
  }

  void scrollToBottom() => scrollController.jumpTo(scrollController.position.maxScrollExtent);

  void sendMessage(String text, String senderPhone, String receiverPhone) {
    final message = MessageDetailModel(
      isSent: true,
      text: text,
      receiverPhone: receiverPhone,
      senderPhone: senderPhone,
      timestamp: formatTimestamp(DateTime.now()),
    );
    LocaleManager.instance.setStringListValue(CacheKey.messageDetailKey, message == null ? [] : message.toJson());
    messageList.add(message);
    textEditingController.clear();
    scrollToBottom();
  }

// Mesaj alma işlevi
  List<MessageDetailModel> getMessages(String receiverName) {
    return messageList.where((message) => message.receiverPhone == receiverName).toList();
  }
}
