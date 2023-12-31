import 'dart:convert';

import 'package:ace/controller/auth/auth_controller.dart';
import 'package:ace/models/auth/profile.dart';
import 'package:ace/models/mogak/mogak_model.dart';
import 'package:ace/models/mogak/mogak_talk_model.dart';
import 'package:ace/routes/api_route.dart';
import 'package:ace/utils/button.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MogakController extends GetxController {
// 토큰 가져오기
  String token = Get.find<AuthController>().getToken();

// 모각 리스트
  RxList<AllMogakModel> allMogakList = RxList<AllMogakModel>();
  RxList<AllMogakModel> topMogakList = RxList<AllMogakModel>();

// 검색어를 나타내는 RxString
  RxString searchText = RxString('');
  RxList<AllMogakModel> searchResults = RxList<AllMogakModel>();

  ProfileModel? profile = Get.find<AuthController>().profileData.value;
// 날자순 정렬 상태를 나타내는 bool값
  var isSortedList = false.obs;
// 페이지가 통신이 완료 보여지게 하기위한 스켈레톤 bool값
  var isLoading = false.obs;
  final dio = Dio();

  @override
  void onInit() {
    super.onInit();
    refreshMogaks(); // onInit에서 데이터 새로고침을 호출
  }
// 검색
  void searchMogaks() {
    print('검색실행');
    // 검색어를 가져옴
    final query = searchText.value.trim().toLowerCase();

    // 검색 결과를 초기화
    searchResults.clear();

    if (query.isNotEmpty) {
      // 검색어가 공백이 아닌 경우에만 검색을 진행
      searchResults.addAll(
        allMogakList.where(
          (mogak) => mogak.title.toLowerCase().contains(query),
        ),
      );
      searchResults.addAll(
        topMogakList.where(
          (mogak) => mogak.title.toLowerCase().contains(query),
        ),
      );
    }
  }

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
            final List<MogakTalkModel> talksList = talksJson
                .map((jsonItem) =>
                    MogakTalkModel.fromJson(json.encode(jsonItem)))
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
// 모각 좋아요
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
// 모각 새로고침
  Future<void> refreshMogaks() async {
    isLoading(true); // 로딩 시작
    try {
      await Future.wait([
        fetchListMogak(ApiRoute.mogakApi, allMogakList),
        fetchListMogak(ApiRoute.mogakTopApi, topMogakList),
      ]);
    } finally {
      isLoading(false); // 로딩 종료
    }
  }

// 모각 정렬
  void sortMogaksByDate(bool isTopMogak) {
    RxList<AllMogakModel> targetList;

    if (isTopMogak) {
      targetList = topMogakList;
    } else if (!isTopMogak) {
      targetList = allMogakList;
    } else {
      print("Invalid list type");
      return;
    }

    if (isSortedList.isTrue) {
      targetList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    } else {
      targetList.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    }

    isSortedList.toggle();
    update();
  }
// 모각 댓글
  Future<void> fetchCommentMogak(String mogakId) async {
    try {
      var response = await dio.delete(
        ApiRoute.mogakApi + mogakId,
        options: Options(headers: {"Authorization": token}),
      );
      if (response.statusCode == 200) {
        print('삭제 성공');
      } else {
        print('통신 오류: ${response.statusCode}');
      }
    } catch (e) {
      print('일반 에러: $e');
    } finally {}
  }

// 모각 모달
  void showDeleteDialog(String mogakId) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // 라운드 테두리를 줄 값 설정
        ),
        child: Container(
          width: 242,
          height: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(bottom: 16, left: 8, right: 8, top: 16),
                child: Text(
                  "모각을 삭제 하시겠습니까?",
                  style: AppTypography.tapButtonCardTitle16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      style: AppButton.smallOutLine.copyWith(
                        elevation: MaterialStateProperty.all<double?>(0),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        '취소하기',
                        style: AppTypography.button36Regular
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      style: AppButton.small.copyWith(
                        elevation: MaterialStateProperty.all<double?>(0),
                      ),
                      onPressed: () {
                        fetchCommentMogak(mogakId);
                        Get.back(); // 참여하기 버튼 클릭시 실행될 동작
                      },
                      child: Text(
                        '삭제하기',
                        style: AppTypography.button36Regular
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  // 버튼 사이 간격 조절
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
