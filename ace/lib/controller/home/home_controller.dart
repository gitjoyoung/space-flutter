import 'package:ace/controller/auth_controller.dart';
import 'package:ace/controller/mogak/mogak_cotroller.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/views/catchpage/catch.dart';
import 'package:ace/views/homepage/home.dart';
import 'package:ace/views/mogakpage/mogak.dart';
import 'package:ace/views/mypage/my.dart';
import 'package:ace/views/talkpage/talk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String token = Get.find<AuthController>().getToken();
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex(index);
  }

  void goToHome() {
    tabIndex(0);
    Get.offAllNamed(ViewRoute.homePage);
  }

  Widget get currentPage {
    switch (tabIndex.value) {
      case 0:
        return Home();
      case 1:
        return Talk();
      case 2:
        return Catch();
      case 3:
        return Mogak();
      case 4:
        return My();
      default:
        return Home();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
