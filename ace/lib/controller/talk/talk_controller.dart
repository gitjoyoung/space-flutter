import 'dart:convert';

import 'package:ace/controller/auth_controller.dart';
import 'package:ace/models/talk/talk_model.dart';
import 'package:ace/routes/api_route.dart';
import 'package:ace/utils/button.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TalkController extends GetxController {
  String token = Get.find<AuthController>().getToken();
  var talkContent = TextEditingController();
  RxList<TalkModel> talkList = RxList<TalkModel>();
  RxList<TalkModel> topTalkList = RxList<TalkModel>();

  final dio = Dio();

// 토크 리스트 가져오기
  Future<void> fetchListTalk() async {
    try {
      final response = await dio.get(
        ApiRoute.talkAllApi,
      );
      if (response.statusCode == 200) {
        var resdata = response.data['data'];

        final List<TalkModel> talksList = resdata
            .map<TalkModel>((jsonItem) => TalkModel.fromMap(jsonItem))
            .toList();
        // // 데이터를 talkModels 리스트에 추가
        talkList.assignAll(talksList);
        TopTalks();
        print('talkModels: $talkList');
      }
    } catch (e) {
      print('like 일반 오류: $e');
    }
  }

  // 핫한 토크 리스트 정렬
  Future<void> TopTalks() async {
    try {
      print('탑 톡 리스트');
      final List<TalkModel> sortedTalkList = [...talkList];

      sortedTalkList.sort((a, b) {
        final aScore = a.temperature + (a.childrenLength ?? 0);
        final bScore = b.temperature + (b.childrenLength ?? 0);
        return bScore.compareTo(aScore);
      });

      final top5Talks = sortedTalkList.take(5).toList();
      topTalkList.assignAll(top5Talks);
    } catch (e) {
      print('오류 발생: $e');
    }
  }

// 토크 글 작성

  Future<void> createTalk() async {
    try {
      final response = await dio.post(
        ApiRoute.createTalkApi,
        options: Options(headers: {"Authorization": token}),
        data: {
          "mogakId": null, // mogakId를 주면 모각의 댓글
          "catchUpId": null, // catchupId를 주면 캐치업의 댓글
          "parentId": null, // parentId를 주면 댓글
          "content": talkContent.text,
        },
      );
      if (response.statusCode == 200) {
        var resdata = response.data['data'];

        print('톡 생성 완료 톡 내용 : $talkList');
      }
    } catch (e) {
      print('like 일반 오류: $e');
    }
  }

// 몇 분전 표시
  String formatTimeDifference(DateTime? dateTime) {
    if (dateTime == null) return '';

    final now = DateTime.now();
    final localDateTime = dateTime.toLocal(); // UTC를 로컬 시간대로 변환
    print(localDateTime);

    final difference = now.difference(localDateTime);

    if (difference.inMinutes < 1) {
      return '방금 전';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}분 전';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}시간 전';
    } else {
      return '${difference.inDays}일 전';
    }
  }

// 톡 생성 모달
  void createTalkModal() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // 라운드 테두리를 줄 값 설정
        ),
        insetPadding: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: TextField(
                  maxLines: 10,
                  style: AppTypography.button36Medium,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: '내용을 입력해주세요.',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  controller: talkContent,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      style: AppButton.smallOutLine.copyWith(
                        elevation: MaterialStateProperty.all<double?>(0),
                      ),
                      onPressed: () {
                        talkContent.text = '';
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
                        createTalk().then((value) => fetchListTalk());
                        talkContent.text = '';

                        Get.back(); // 참여하기 버튼 클릭시 실행될 동작
                      },
                      child: Text(
                        '등록하기',
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

// 톡 삭제 모달
  void deleteTalkModal(String talkId) {
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
                  "내 톡을 삭제하시겠습니까?",
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

  @override
  void onInit() {
    fetchListTalk();
    // TODO: implement onInit
    super.onInit();
  }
}
