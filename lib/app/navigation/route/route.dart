import 'package:flutter/material.dart' show PageRoute, RouteSettings;
import '../../../screens/landing/splash_screen/splash_screen.dart';
import '../../../screens/main/main/main_screen.dart';
import '../../../screens/main/messages_screen/messages_screen.dart';
import '../../../screens/main/premium_screen/premium_screen.dart';
import '../../../screens/main/recents_screen/recents_screen.dart';
import '../../../screens/side/message_detail_screen/message_detail_screen.dart';
import 'page_route_builder.dart';

typedef PageRouteFun = PageRoute Function(RouteSettings);

enum MainScreensEnum {
  init('/'),
  mainScreen('main/mainScreen'),
  recentsScreen('main/recentsScreen'),
  premiumScreen('main/preiumScreen'),
  messagesScreen('main/messagesScreen'),
  messageDetailScreen('side/messageDetailScreen');

  const MainScreensEnum(this.path);

  final String path;
}

Map<String, PageRouteFun> mainRoutesMap = {
  MainScreensEnum.init.path: (_) => goToPage(const SplashScreen(), _),
  MainScreensEnum.mainScreen.path: (_) => goToPage(const MainScreen(), _),
  MainScreensEnum.recentsScreen.path: (_) => goToPage(const RecentsScreen(), _),
  MainScreensEnum.premiumScreen.path: (_) => goToPage(const PremiumScreen(), _),
  MainScreensEnum.messagesScreen.path: (_) => goToPage(const MessagesScreen(), _),
  MainScreensEnum.messageDetailScreen.path: (_) => goToPage(const MessageDetailScreen(), _),
};

final bottomNavigationBarScreens = [
  const PremiumScreen(),
  const RecentsScreen(),
  const MessagesScreen(),
];
