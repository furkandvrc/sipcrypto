import 'package:flutter/material.dart';
import 'package:cryptalone/screens/main/recents_screen/controller/recents_controller.dart';
import 'package:get/get.dart';
import '../../../../app/components/app_bar/app_bar.dart';
import '../../../../app/theme/text_style/text_style.dart';

class Recents extends StatelessWidget {
  const Recents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RecentsController>();
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: MyAppBar(
        titleWidget: Text(
          "CryptAlone",
          style: s26W700Dark,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.forum, color: Color(0xFF051745)),
              iconSize: 300,
            )
          ],
        ),
      ),
    );
  }
}
