import 'package:ace/controller/auth/auth_controller.dart';
import 'package:ace/controller/talk/talk_controller.dart';
import 'package:ace/models/talk/talk_detail_model.dart';
import 'package:ace/models/talk/talk_model.dart';
import 'package:ace/routes/api_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TalkDetailController extends GetxController {
  String token = Get.find<AuthController>().getToken();

  Rx<TalkModel?> talkDetail = Rx<TalkModel?>(null);
  Rx<TalkDetailModel> talkDetailWithComment =
      Rx<TalkDetailModel>(TalkDetailModel());
  TextEditingController commentController = TextEditingController();

  final dio = Dio();
  late String talkId;

  var formatTimeDifference = Get.find<TalkController>().formatTimeDifference;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is TalkModel) {
      talkDetail.value = Get.arguments as TalkModel;
      talkId = talkDetail.value?.id ?? '';
      print(talkId);
      fetchDetailTalk(talkId);
    } else {
      print("톡톡 디테일 arg 통신 오류");
    }
  }

 Future<void> fetchCommentTalk() async {
    try {
      var response = await dio.post(
        ApiRoute.mogakTalkApi,
        data: {
          "parentId": talkDetail.value?.id,
          "content": commentController.text,
        },
        options: Options(headers: {"Authorization": token}),
      );
      if (response.statusCode == 200) {
        print("댓글 업로드 성공: ${response.data}");
        commentController.clear();
      } else {
        print('댓글 업로드 통신실패: ${response.statusCode}');
      }
    } catch (e) {
      print('일반 에러: $e');
    } finally {
      fetchDetailTalk(talkId);
    }
  }

  Future<void> fetchDetailTalk(String id) async {
    try {
      final response = await dio.get(
        ApiRoute.talkApi + id,
      );
      if (response.statusCode == 200) {
        var resdata = response.data['data'];
        print('resdata  :' + resdata.toString());
        final TalkDetailModel talks = TalkDetailModel.fromMap(resdata);
        // // 데이터를 talkModels 리스트에 추가
        talkDetailWithComment.value = talks;
        print(
            '댓글이 잘들어 오나?: ${talkDetailWithComment.value.children.toString()}');
      }
    } catch (e) {
      print('like 일반 오류: $e');
    }
  }
}
