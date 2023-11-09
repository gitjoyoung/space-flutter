import 'dart:convert';

import 'package:ace/controller/auth_controller.dart';
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
  RxString visiblityStatus = RxString('OPEN'); // 모집 상태
  RxString postContent = RxString('');
  Rx<AllMogakModel?> mogakDetail = Rx<AllMogakModel?>(null);
  var isLoading = true.obs;
  late String id;
  var dio = Dio();
  String token = Get.find<AuthController>().getToken();

  Future<void> fetchCommentMogak() async {
    var response = await dio.get(ApiRoute.mogakTalkApi,
        data: {
          "mogakId": mogakDetail.value!.id, 
          "content": postContent,
        },
        options: Options(headers: {"Authorization": token}));
    if (response.statusCode == 200) {
      print(response.data.toString());
    } else {
      print('통신실패');
    }
  }

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
      print("모각 디테일 주소 오류");
    }
  }

  Future<void> fetchMogakDetail(String id) async {
    isLoading(true);

    // 글아이디 clo5fdhqb0004mk091m5p5p25

    // final url =  'https://dev.sniperfactory.com/api/mogak/clomvvdld0000jk08yhd30kq3';

    try {
      print('통신 실행');
      final response = await dio.get(ApiRoute.mogakApi + mogakDetail.value!.id,
          options: Options(headers: {"Authorization": token}));

      if (response.statusCode == 200) {
        var jsonArray = response.data['data'];
        print("모각 상세조회 리스폰스 데이타 " + jsonArray);

        mogakDetail.value = AllMogakModel.fromMap(jsonArray);
      } else {
        print('모각 상세조회  통신 실패');
      }
    } finally {
      isLoading(false);
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

  Future<void> fetchJoinMogak(String mogakId) async {
    isLoading(true);
    try {
      print('통신 실행');
      final response = await dio.post(ApiRoute.mogakApi + mogakId + '/apply',
          options: Options(headers: {"Authorization": token}));

      if (response.statusCode == 200) {
        print("토큰 :" + token);

        print("모각참여 통신 성공 메세지 :" + response.data.toString());
      } else {
        print('모각 참여하기 통신 실패');
      }
    } finally {
      isLoading(false);
    }
  }

// 프로필 조회
  Future<void> fetchProfile(String authId) async {
    var response = await dio.get(ApiRoute.profileApi + authId,
        options: Options(headers: {"Authorization": token}));
    if (response.statusCode == 200) {
      ProfileModel profile = ProfileModel.fromMap(response.data['data']);
      print(profile.toMap());
    }
  }

  void showCustomDialog(String mogakId) {
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
                        Get.back();
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
                        print('모각참여하기 버튼 ' + mogakId);
                        fetchJoinMogak(mogakId);
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
