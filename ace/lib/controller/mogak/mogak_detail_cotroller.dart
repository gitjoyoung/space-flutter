import 'dart:convert';

import 'package:ace/models/mogak/mogak_model.dart';
import 'package:ace/models/mogak/profile.dart';
import 'package:ace/routes/api_route.dart';
import 'package:ace/utils/button.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MogakDetailController extends GetxController {
  RxBool isLiked = RxBool(false);
  RxString visiblityStatus = RxString('OPEN'); // 모집 상태
  RxString postContent = RxString('저희는 유니티로 개발을 공부해서...');
  Rx<AllMogakModel?> mogakDetail = Rx<AllMogakModel?>(null);
  var isLoading = true.obs;
  late String id;
  var dio = Dio();

  String authId = "clo5fdhqb0004mk091m5p5p25";
  String token =
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsbzNrNWRtaDAwMDBtcjA4aG50aWFsYTMiLCJlbWFpbCI6InNuaXBlcmZhY3RvcnlAZ21haWwuY29tIiwidmVyaWZpZWRFbWFpbCI6ZmFsc2UsInZlcmlmaWVkUGhvbmUiOmZhbHNlLCJuYW1lIjoi6rmA7Iqk7YypIiwicHJvZmlsZSI6eyJpZCI6ImNsbzNrN2p4djAwMDFtcjA4dHM4OGIxdzYiLCJuaWNrbmFtZSI6Iuq5gOyKpO2MqeyUqCIsImF2YXRhciI6Imh0dHBzOi8vc25pcGVyZmFjdG9yeS5zMy5hcC1ub3J0aGVhc3QtMi5hbWF6b25hd3MuY29tL2NsbzVmZDVyODAwMDBsNzA4ejhjbWEycnQvc2NyZWVuc2hvdC5wbmciLCJwb3NpdGlvbiI6IkRFVkVMT1BFUiIsInJvbGUiOiJORVdCSUUifSwiaWF0IjoxNjk5MzU2MTk0fQ.b_aXzMeNetKTHy9C0VjZB2xUuLewjdY7hwqj-yQSAME";
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is AllMogakModel) {
      mogakDetail.value = Get.arguments as AllMogakModel;
      // 'id' 필드를 사용할 경우, 아래와 같이 설정할 수 있습니다.
      id = mogakDetail.value?.id ?? '';
      // 상세 정보를 가져오는 함수를 호출할 수 있습니다.
      fetchMogakDetail(id);
    } else {
      // 'Get.arguments'가 'AllMogakModel' 타입이 아닌 경우 에러 처리
      print("Error: Get.arguments is not a AllMogakModel");
    }
  }

  void toggleLike() {
    isLiked.value = !isLiked.value;
  }

  // clo5fdhqb0004mk091m5p5p25

  Future<void> fetchMogakDetail(String id) async {
    isLoading(true);
    // final url =
    //     'https://dev.sniperfactory.com/api/mogak/clomvvdld0000jk08yhd30kq3';

    try {
      print('통신 실행');
      final response = await dio.get(ApiRoute.mogakApi + mogakDetail.value!.id ,
          options: Options(headers: {"Authorization": token}));

      if (response.statusCode == 200) {
        var jsonArray = response.data['data'];
        print(jsonArray);

        mogakDetail.value = AllMogakModel.fromMap(jsonArray);

        // mogakDetail.assignAll(mogakList); // 응답 데이터를 옵저버블 변수에 할당합니다.
      } else {
        // 에러 처리
        print('Failed to load mogak detail');
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchProfile(String authId) async {
    var response = await dio.get(ApiRoute.profileApi + authId,
        options: Options(headers: {"Authorization": token}));
    if (response.statusCode == 200) {
      ProfileModel profile = ProfileModel.fromMap(response.data['data']);
      print(profile.toMap());
    }
  }

  Future<void> fetchEditMogak() async {
    var res = await dio.get(ApiRoute.mogakApi,
        data: {
          // "title": "모각코 이름 변경 테스트",
          "content": postContent,
          // "maxMember": 4,
          "visiblityStatus": visiblityStatus
        },
        options: Options(headers: {"Authorization": token}));
    print(res.data);
  }

  Future<void> fetchJoinMogak(String id) async {
    isLoading(true);
    // final url = 'https://dev.sniperfactory.com/api/mogak/$id';

    try {
      print('통신 실행');
      final response = await dio.get(ApiRoute.mogakApi + id + '/apply',
          options: Options(headers: {"Authorization": token}));

      if (response.statusCode == 200) {
        var jsonArray = response.data['data'];
        print(jsonArray);

        mogakDetail.value = AllMogakModel.fromMap(jsonArray);

        // mogakDetail.assignAll(mogakList); // 응답 데이터를 옵저버블 변수에 할당합니다.
      } else {
        // 에러 처리
        print('Failed to load mogak detail');
      }
    } finally {
      isLoading(false);
    }
  }

  void showCustomDialog() {
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
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 16, left: 8, right: 8, top: 16),
                child: Text(
                  "그룹에 참여하시겠습니까?",
                  style: AppTypograpy.tapButtonCardTitle16,
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
                        Get.back(); // 참여하기 버튼 클릭시 실행될 동작
                      },
                      child: Text(
                        '취소하기',
                        style: AppTypograpy.button36Regular
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      style: AppButton.small.copyWith(
                        elevation: MaterialStateProperty.all<double?>(0),
                      ),
                      onPressed: () {
                        Get.back(); // 참여하기 버튼 클릭시 실행될 동작
                      },
                      child: Text(
                        '참여하기',
                        style: AppTypograpy.button36Regular
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
