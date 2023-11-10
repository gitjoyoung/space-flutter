import 'dart:convert';

import 'package:ace/controller/auth_controller.dart';
import 'package:ace/models/home/banner.dart';
import 'package:ace/routes/api_route.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/views/catchpage/catch.dart';
import 'package:ace/views/homepage/home.dart';
import 'package:ace/views/mogakpage/mogak.dart';
import 'package:ace/views/mypage/my.dart';
import 'package:ace/views/talkpage/talk.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String token = Get.find<AuthController>().getToken();
  RxList<BannerModel> bannerList = RxList<BannerModel>();

  var tabIndex = 0.obs;
  final dio = Dio();

  void changeTabIndex(int index) {
    tabIndex(index);
  }

  void goToHome() {
    tabIndex(0);
    Get.offAllNamed(ViewRoute.homePage);
  }

  Future<void> fetchHomeBanner() async {
    try {
      final response = await dio.get(
        ApiRoute.homeBannerApi,
      );
      if (response.statusCode == 200) {
        var resdata = response.data['data'];
        print(resdata);
        List<BannerModel> data = resdata
            .map<BannerModel>((item) => BannerModel.fromMap(item))
            .toList();
        print('홈배너: $data.toString()');

        bannerList.assignAll(data);
      }
    } catch (e) {
      print('like 일반 오류: $e');
    }
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
    fetchHomeBanner();
  }
}
