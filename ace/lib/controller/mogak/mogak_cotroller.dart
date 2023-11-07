import 'dart:convert';

import 'package:ace/models/mogak/mogak_model.dart';
import 'package:ace/routes/api_route.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MogakController extends GetxController {
  late Rx<AllMogakModel> selectMogak;

  RxList<AllMogakModel> allMogakModels = RxList<AllMogakModel>();
  RxList<AllMogakModel> topMogakModels = RxList<AllMogakModel>();
  var isLoading = false.obs;

  var dio = Dio();
  Future<bool> fetchMogaks(
      String apiRoute, RxList<AllMogakModel> targetList) async {
    try {
      final response = await Dio().get(apiRoute);
      if (response.statusCode == 200) {
        List<dynamic> jsonArray = response.data['data'];
        List<AllMogakModel> mogakList = jsonArray
            .map((jsonItem) => AllMogakModel.fromJson(json.encode(jsonItem)))
            .toList();
        for (final mogak in mogakList) {
          print(mogak.toMap());
        }
        targetList.assignAll(mogakList);
        return true;
      } else {
        print('모델링 실패');
        return false;
      }
    } catch (e) {
      print('통신 실패: $e');
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    // 두 개의 API 호출을 병렬로 실행하고, 모두 성공했을 때 true 반환
    Future.wait([
      fetchMogaks(ApiRoute.mogak, allMogakModels),
      fetchMogaks(ApiRoute.topMogak, topMogakModels),
    ]).then((results) {
      // 모든 API 호출이 성공했을 때 true로 설정
      bool allSuccess = results.every((result) => result == true);
      if (allSuccess) {
        isLoading.value = true;
      } else {
        // 데이터 로딩 실패 - 에러 처리 로직 추가
        // 사용자에게 에러 메시지를 표시할 수 있음
      }
    });
  }
}
