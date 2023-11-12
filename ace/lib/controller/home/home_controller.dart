import 'dart:convert';

import 'package:ace/controller/auth_controller.dart';
import 'package:ace/models/home/banner.dart';
import 'package:ace/models/home/rank.dart';
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

  RxList<RankModel> rankList = RxList<RankModel>();

  var bannerPageController = PageController();
  var rankPageController =
      PageController(initialPage: 0, viewportFraction: 1);

  var tabIndex = 0.obs;
  final dio = Dio();

  void changeTabIndex(int index) {
    tabIndex(index);
  }

  void goToHome() {
    tabIndex(0);
    Get.toNamed(ViewRoute.homePage);
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

  Future<void> fetchListRank() async {
    try {
      final response = await dio.get(ApiRoute.homeSpacerRank,
          options: Options(headers: {"Authorization": token}));
      if (response.statusCode == 200) {
        final List<dynamic> jsonArray = response.data['data']['res'];

        print('받아온 통신' + jsonArray.toString());
        final newRankList =
            jsonArray.map((jsonItem) => RankModel.fromMap(jsonItem)).toList();

        rankList.assignAll(newRankList);
      } else {
        print('API 요청 실패: ${response.statusCode}');
      }
    } catch (e) {
      print('기타 오류: $e');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchHomeBanner();
    fetchListRank();
  }

  refreshMogaks() {}
}
