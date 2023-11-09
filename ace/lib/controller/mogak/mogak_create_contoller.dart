import 'package:ace/controller/auth_controller.dart';
import 'package:ace/routes/api_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MogakCreateController extends GetxController {
  RxString postTitle = RxString(''); // 제목
  RxString postContent = RxString(''); // 내용
  RxInt maxParticipants = RxInt(0); // 최대 참여 인원
  RxString postHashTag = RxString(''); // 해시태그
  RxString visiblityStatus = RxString(''); // 모집 상태
  var dio = Dio();

  String token = Get.find<AuthController>().getToken();

  Future<void> createMogak() async {
    if (postTitle.isEmpty) {
      showErrorDialog('제목이 비어있습니다.');
      return;
    }

    if (postContent.isEmpty) {
      showErrorDialog('내용이 비어있습니다.');
      return;
    }

    if (maxParticipants <= 0) {
      showErrorDialog('모집인원을 정해주세요.');
      return;
    }

    if (!["HIDDEN", "OPEN", "CLOSE"].contains(visiblityStatus.value)) {
      showErrorDialog('모집상태를 선택하지 않았습니다.');
      return;
    }
    try {
      print(token);
      var response = await dio.post(
        ApiRoute.mogakCreateApi,
        data: {
          "title": postTitle.value,
          "content": postContent.value,
          "maxMember": maxParticipants.value,
          "hashtag": postHashTag.value,
          "visiblityStatus": visiblityStatus.value
        },
        options: Options(
          headers: {"Authorization": token},
        ),
      );

      if (response.data['status'] == 'sucsess') {
        // 성공적으로 데이터가 생성되었을 때의 처리
        print(response.data.toString());
        Get.back();
      } else {
        // 서버가 200 외의 상태 코드를 반환했을 때의 처리
        print('통신 실패: ${response.data}');
      }
    } catch (e) {
      showErrorDialog('에러 발생: $e');
      print('An unknown error occurred: $e');
    }
  }

  void showErrorDialog(String message) {
    Get.defaultDialog(
      title: '에러 발생',
      content: Text(message),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back(); // 다이얼로그를 닫습니다.
          },
          child: Text('확인'),
        ),
      ],
    );
  }
}
