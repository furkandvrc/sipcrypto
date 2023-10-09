import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentsController extends GetxController {
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;
}
