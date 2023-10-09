import 'package:flutter/material.dart';
import 'package:cryptalone/app/model/response/message_model.dart';
import 'package:get/get.dart';

import '../../../../app/constants/enum/arguments_enum.dart';
import '../../../../app/extensions/time_extension.dart';
import '../../../../app/navigation/route/route.dart';

class MessagesController extends GetxController {
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  ScrollController scrollController = ScrollController();

  BuildContext get context => scaffoldKey.currentContext!;
  final RxList<AllMessageList> _messageList = <AllMessageList>[].obs;

  List<AllMessageList> get messageList => _messageList;
  set messageList(List<AllMessageList> value) => _messageList.value = value;

  

  @override
  void onInit() {
    messageList = [
      AllMessageList(
          message: "Selam, nasılsın? napıyorsun? iyimisin? iyi olmanı dilerim. Buraya daha fazla uzun bir mesaj ekleyebilirsiniz.",
          userName: "Furkan Divarcı",
          phoneNumber: "905522189174",
          timestamp: formatTimestamp(DateTime.now()),
          isRead: false,
          unreadCount: 1,
          isSent: true),
      AllMessageList(
          message: "Selam, nasılsın? napıyorsun? iyimisin? iyi olmanı dilerim. Buraya daha fazla uzun bir mesaj ekleyebilirsiniz.",
          userName: "Furkan Divarcı",
          phoneNumber: "905522189174",
          timestamp: formatTimestamp(DateTime.now()),
          isRead: false,
          unreadCount: 2,
          isSent: true),
      AllMessageList(
          message: "Selam, nasılsın? napıyorsun? iyimisin? iyi olmanı dilerim. Buraya daha fazla uzun bir mesaj ekleyebilirsiniz.",
          userName: "Furkan Divarcı",
          phoneNumber: "905522189174",
          timestamp: formatTimestamp(DateTime.now()),
          isRead: false,
          unreadCount: 3,
          isSent: true),
      AllMessageList(
          message: "Selam, nasılsın? napıyorsun? iyimisin? iyi olmanı dilerim. Buraya daha fazla uzun bir mesaj ekleyebilirsiniz.",
          userName: "Furkan Divarcı",
          phoneNumber: "905522189174",
          timestamp: formatTimestamp(DateTime.now()),
          isRead: false,
          unreadCount: 5,
          isSent: false),
      AllMessageList(
          message: "Selam, nasılsın? napıyorsun? iyimisin? iyi olmanı dilerim. Buraya daha fazla uzun bir mesaj ekleyebilirsiniz.",
          userName: "Furkan Divarcı",
          phoneNumber: "905522189174",
          timestamp: formatTimestamp(DateTime.now()),
          isRead: false,
          unreadCount: 0,
          isSent: false),
      AllMessageList(
          message: "Selam, nasılsın? napıyorsun? iyimisin? iyi olmanı dilerim. Buraya daha fazla uzun bir mesaj ekleyebilirsiniz.",
          userName: "Furkan Divarcı",
          phoneNumber: "905522189174",
          timestamp: formatTimestamp(DateTime.now()),
          isRead: false,
          unreadCount: 0,
          isSent: false),
      AllMessageList(
          message: "Selam, nasılsın? napıyorsun? iyimisin? iyi olmanı dilerim. Buraya daha fazla uzun bir mesaj ekleyebilirsiniz.",
          userName: "Furkan Divarcı",
          phoneNumber: "905522189174",
          timestamp: formatTimestamp(DateTime.now()),
          isRead: true,
          unreadCount: 0,
          isSent: true),
      AllMessageList(
          message: "Selam, nasılsın? napıyorsun? iyimisin? iyi olmanı dilerim. Buraya daha fazla uzun bir mesaj ekleyebilirsiniz.",
          userName: "Furkan Divarcı",
          phoneNumber: "905522189174",
          timestamp: formatTimestamp(DateTime.now()),
          isRead: true,
          unreadCount: 0,
          isSent: true),
      AllMessageList(
          message: "Selam, nasılsın? napıyorsun? iyimisin? iyi olmanı dilerim. Buraya daha fazla uzun bir mesaj ekleyebilirsiniz.",
          userName: "Furkan Divarcı",
          phoneNumber: "905522189174",
          timestamp: formatTimestamp(DateTime.now()),
          isRead: true,
          unreadCount: 0,
          isSent: true),
      AllMessageList(
          message: "Selam, nasılsın? napıyorsun? iyimisin? iyi olmanı dilerim. Buraya daha fazla uzun bir mesaj ekleyebilirsiniz.",
          userName: "Furkan Divarcı",
          phoneNumber: "905522189174",
          timestamp: formatTimestamp(DateTime.now()),
          isRead: false,
          unreadCount: 5,
          isSent: true),
      AllMessageList(
          message: "Selam, nasılsın? napıyorsun? iyimisin? iyi olmanı dilerim. Buraya daha fazla uzun bir mesaj ekleyebilirsiniz.",
          userName: "Furkan Divarcı",
          phoneNumber: "905522189174",
          timestamp: formatTimestamp(DateTime.now()),
          isRead: true,
          unreadCount: 0,
          isSent: true),
      AllMessageList(
          message: "Selam, nasılsın? napıyorsun? iyimisin? iyi olmanı dilerim. Buraya daha fazla uzun bir mesaj ekleyebilirsiniz.",
          userName: "Furkan Divarcı",
          phoneNumber: "905522189174",
          timestamp: formatTimestamp(DateTime.now()),
          isRead: true,
          unreadCount: 0,
          isSent: true),
    ];
    super.onInit();
  }

  void goToMessageDetailScreen(String name, String phoneNumber) {
    Navigator.pushNamed(
      context,
      MainScreensEnum.messageDetailScreen.path,
      arguments: {MessageScreenArgumentEnum.phoneNumber: phoneNumber, MessageScreenArgumentEnum.userName: name},
    );
  }
}
