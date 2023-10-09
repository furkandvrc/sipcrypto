import 'dart:convert';

import 'package:cryptalone/app/constants/enum/cache_key_enum.dart';
import 'package:cryptalone/app/libs/locale_manager/locale_manager.dart';

class AllMessageList {
  final String message;
  final String userName;
  final String phoneNumber;
  final String timestamp;
  bool isRead;
  final int unreadCount;
  final bool isSent;

  AllMessageList({
    required this.message,
    required this.userName,
    required this.phoneNumber,
    required this.timestamp,
    required this.isRead,
    required this.unreadCount,
    required this.isSent,
  });

  // MessageData sınıfını Map'e çevirme işlemi
  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'timestamp': timestamp,
      'isRead': isRead,
      'unreadCount': unreadCount,
      "isSent": isSent,
    };
  }

  // Map'i MessageData sınıfına çevirme işlemi
  factory AllMessageList.fromMap(Map<String, dynamic> map) {
    return AllMessageList(
      message: map['message'],
      userName: map['userName'],
      phoneNumber: map['phoneNumber'],
      timestamp: map['timestamp'],
      isRead: map['isRead'],
      unreadCount: map['unreadCount'],
      isSent: map['isSent'],
    );
  }
}

class LocalMessageStorage {
  // Yerel verileri kaydetme
  static Future<void> saveMessageData(List<AllMessageList> messageDataList) async {
    final List<Map<String, dynamic>> messageDataMapList = messageDataList.map((messageData) => messageData.toMap()).toList();
    await LocaleManager.instance.setStringListValue(CacheKey.messageDataKey, messageDataMapList.map((e) => e.toString()).toList());
  }

  // Yerel verileri okuma
  static Future<List<AllMessageList>> loadMessageData() async {
    final List<String>? messageDataStringList = LocaleManager.instance.getStringListValue(CacheKey.messageDataKey);

    if (messageDataStringList == null || messageDataStringList.isEmpty) {
      return []; // Eğer veri yoksa boş bir liste döndürün.
    }

    return messageDataStringList.map((messageDataString) {
      final Map<String, dynamic> messageDataMap = json.decode(messageDataString);
      return AllMessageList.fromMap(messageDataMap);
    }).toList();
  }
}
