import 'package:ace/controller/auth_controller.dart';

import 'package:ace/models/catch/catch_model.dart';
import 'package:ace/models/catch/catch_model.dart';
import 'package:ace/routes/api_route.dart';
import 'package:ace/routes/view_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CatchController extends GetxController {
  String token = Get.find<AuthController>().getToken();

  RxList<AllCatchModel> allCatchModels = RxList<AllCatchModel>();
  RxList<AllCatchModel> topCatchModels = RxList<AllCatchModel>();

  // 검색어를 나타내는 RxString
  RxString searchText = RxString('');
  RxString selectedHashTag = ''.obs;
  RxList<AllCatchModel> searchResults = RxList<AllCatchModel>();

// 날자순 정렬 상태를 나타내는 bool값
  var isSortedList = false.obs;
  var isLoading = false.obs;
  final dio = Dio();

  void searchCatchs() {
    print('검색실행');

    // 검색어를 가져옴
    final query = searchText.value.trim().toLowerCase();

    // 검색 결과를 초기화
    searchResults.clear();

    if (query.isNotEmpty) {
      // 검색어가 공백이 아닌 경우에만 검색을 진행
      searchResults.addAll(
        allCatchModels.where(
          (catchs) => catchs.title.toLowerCase().contains(query),
        ),
      );
      searchResults.addAll(
        topCatchModels.where(
          (catchs) => catchs.title.toLowerCase().contains(query),
        ),
      );
    }
  }

  void updateSelectedHashTag(String hashTag) {
    selectedHashTag.value = hashTag;
  }

  void clearSelectedHashTag() {
    selectedHashTag.value = '';
  }

  Future<void> fetchAllCatchModels(
      String url, RxList<AllCatchModel> listToUpdate) async {
    Dio dio = Dio();
    try {
      var response = await dio.get(url);

      if (response.statusCode == 200) {
        // 서버에서 성공적으로 응답을 받았을 때
        List<dynamic> jsonResponse = response.data['data'];
        List<AllCatchModel> models = List<AllCatchModel>.from(
            jsonResponse.map((json) => AllCatchModel.fromJson(json)));
        listToUpdate.assignAll(models);
        print(models);
      } else {
        // 서버 응답에 문제가 있을 때
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // 네트워크 오류 또는 데이터 파싱 중 문제가 발생했을 때
      throw Exception('Error occurred: $e');
    }
  }

  Future<void> fetchTopCatchModels(
      String url, RxList<AllCatchModel> listToUpdate) async {
    Dio dio = Dio();
    try {
      var response = await dio.get(url);

      if (response.statusCode == 200) {
        // 서버에서 성공적으로 응답을 받았을 때
        List<dynamic> jsonResponse = response.data;
        List<AllCatchModel> models = List<AllCatchModel>.from(
            jsonResponse.map((json) => AllCatchModel.fromJson(json)));
        listToUpdate.assignAll(models);
        print(models);
      } else {
        // 서버 응답에 문제가 있을 때
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // 네트워크 오류 또는 데이터 파싱 중 문제가 발생했을 때
      throw Exception('Error occurred: $e');
    }
  }

  Future<void> LikeCatch(String catchUpId) async {
    try {
      print('캐치업아이디 ' + catchUpId);
      final response = await dio.post(ApiRoute.catchLikeApi,
          data: {"catchUpId": catchUpId},
          options: Options(headers: {"Authorization": token}));
      if (response.statusCode == 200) {
        var resdata = response.data['data'];
        print('like: $resdata');
      }
    } catch (e) {
      print('like 일반 오류: $e');
    }
  }

  Future<void> refreshCatchs() async {
    isLoading(true); // 로딩 시작
    try {
      await Future.wait([
        fetchAllCatchModels(ApiRoute.catchApi, allCatchModels),
        fetchTopCatchModels(ApiRoute.catchTopApi, topCatchModels)
      ]);
      print('캐치업');
      print(allCatchModels);
      print(allCatchModels); // 결과 확인
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false); // 로딩 종료
    }
  }

  Future<void> launchURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('Could not launch $url');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  void sortCatchsByDate(bool isTopCatch) {
    RxList<AllCatchModel> targetList;

    if (isTopCatch) {
      targetList = topCatchModels;
    } else if (!isTopCatch) {
      targetList = allCatchModels;
    } else {
      print("Invalid list type");
      return;
    }

    if (isSortedList.isTrue) {
      targetList.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    } else {
      targetList.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
    }

    isSortedList.toggle();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    refreshCatchs(); // onInit에서 데이터 새로고침을 호출
  }
}
