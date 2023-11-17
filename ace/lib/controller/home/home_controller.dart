import 'dart:convert';

import 'package:ace/controller/auth/auth_controller.dart';
import 'package:ace/controller/mogak/mogak_cotroller.dart';
import 'package:ace/controller/talk/talk_controller.dart';
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
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  String token = Get.find<AuthController>().getToken();
  RxList<BannerModel> bannerList = RxList<BannerModel>();
  RxList<RankModel> rankList = RxList<RankModel>();

  // 홈 위젯
  var topTalk = Get.find<TalkController>().topTalkList;
  var topMogak = Get.find<MogakController>().topMogakList;

// 배너
  var bannerPageController = PageController();

// 스페이서 랭크 페이지
  var rankPageController =
      PageController(initialPage: 0, viewportFraction: 0.5);

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
      final response = await dio.get(ApiRoute.homeSpacerRankApi,
          options: Options(headers: {"Authorization": token}));
      if (response.statusCode == 200) {
        final List<dynamic> jsonArray = response.data['data']['res'];

        print('랭크 리스트 받아온 통신' + jsonArray.toString());
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

// 페이지이동
  Future<void> movelaunchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString); // 문자열 URL을 Uri 객체로 변환
    if (!await launchUrl(url)) {
      throw 'Could not launch $urlString';
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchHomeBanner();
    fetchListRank();
  }

}
