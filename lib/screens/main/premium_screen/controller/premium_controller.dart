import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PremiumController extends GetxController {
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;
}
