import 'package:ace/routes/api_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MogakCreateController extends GetxController {
  RxString postTitle = RxString(''); // 제목
  RxString postContent = RxString(''); // 내용
  RxInt maxParticipants = RxInt(0); // 최대 참여 인원
  RxString postHashTag = RxString(''); // 해시태그
  RxString visiblityStatus = RxString('OPEN'); // 모집 상태
  var dio = Dio();

  Future<void> createMogak() async {
    var res = await dio.get(ApiRoute.mogak, data: {
      "title": postTitle.value,
      "content": postContent.value,
      "maxMember": maxParticipants.value,
      "hashtag": postHashTag.value,
      "visiblityStatus": visiblityStatus.value
    });
    print(res.data);
  }
}
