import 'dart:convert';

import 'package:ace/controller/auth_controller.dart';
import 'package:ace/models/mogak/mogak_model.dart';
import 'package:ace/models/mogak/talk_model.dart';
import 'package:ace/routes/api_route.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MogakController extends GetxController {
// 토큰 가져오기
  String token = Get.find<AuthController>().getToken();

// 모각 리스트
  RxList<AllMogakModel> allMogakModels = RxList<AllMogakModel>();
  RxList<AllMogakModel> topMogakModels = RxList<AllMogakModel>();

// 날자순 정렬 상태를 나타내는 bool값
  var isSortedList = false.obs;
// 페이지가 통신이 완료 보여지게 하기위한 스켈레톤 bool값
  var isLoading = false.obs;
  final dio = Dio();

// 모달 리스트 가져오기

  Future<void> fetchListMogak(
      String apiRoute, RxList<AllMogakModel> targetList) async {
    try {
      final response = await dio.get(apiRoute);
      if (response.statusCode == 200) {
        final List<dynamic> jsonArray = response.data['data'];
        final mogakList = jsonArray
            .map((jsonItem) => AllMogakModel.fromJson(json.encode(jsonItem)))
            .toList();
        targetList.assignAll(mogakList);
        for (var mogak in mogakList) {
          final detailResponse = await dio.get(ApiRoute.mogakApi + mogak.id,
              options: Options(headers: {"Authorization": token}));
          if (detailResponse.statusCode == 200) {
            final List<dynamic> talksJson =
                detailResponse.data['data']['talks'];
            final List<TalkModel> talksList = talksJson
                .map((jsonItem) => TalkModel.fromJson(json.encode(jsonItem)))
                .toList();

            mogak.addTalks(talksList);
          } else {
            print('상세 모각 정보 가져오기 통신 실패: ${detailResponse.statusCode}');
          }
        }
        // 모델이 업데이트되었으므로 UI를 업데이트하기 위해 리스트를 다시 할당합니다.
        targetList.assignAll(mogakList);
      }
    } catch (e) {
      print('상세 모각 정보 가져오기 주소 문제나 여러 기타 오류: $e');
    }
  }

  Future<void> fetchLikeModak(
    String mogakId,
  ) async {
    try {
      print('모각아이디 ' + mogakId);
      final response = await dio.post(ApiRoute.mogakLikeApi,
          data: {"mogakId": mogakId},
          options: Options(headers: {"Authorization": token}));
      if (response.statusCode == 200) {
        var resdata = response.data['data'];
        print('like: $resdata');
      }
    } catch (e) {
      print('like 일반 오류: $e');
    }
  }

  Future<void> refreshMogaks() async {
    isLoading(true); // 로딩 시작
    try {
      await Future.wait([
        fetchListMogak(ApiRoute.mogakApi, allMogakModels),
        fetchListMogak(ApiRoute.mogakTopApi, topMogakModels),
      ]);
    } finally {
      isLoading(false); // 로딩 종료
    }
  }

  // 핫한 모각코나 모든 모각코를 정렬하는 함수
  void sortMogaksByDate() {
    if (isSortedList.isTrue) {
      topMogakModels.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      allMogakModels.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    } else {
      topMogakModels.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      allMogakModels.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    }
    isSortedList.toggle(); // 정렬 상태 변경
    update(); // UI 갱신을 위해 GetX update 호출
  }

  @override
  void onInit() {
    super.onInit();
    refreshMogaks(); // onInit에서 데이터 새로고침을 호출
  }
}
