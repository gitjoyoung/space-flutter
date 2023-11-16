import 'dart:convert';

import 'package:ace/controller/auth/auth_controller.dart';
import 'package:ace/models/mogak/mogak_model.dart';
import 'package:ace/models/talk/talk_model.dart';
import 'package:ace/routes/api_route.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  String token = Get.find<AuthController>().getToken();

  RxList<TalkModel> myTalkList = RxList<TalkModel>();
  RxList<TalkModel> myCommentTalkList = RxList<TalkModel>();
  RxList<TalkModel> myLikeTalkList = RxList<TalkModel>();

  RxList<AllMogakModel> myMogakList = RxList<AllMogakModel>();
  RxList<AllMogakModel> myJoinMogakList = RxList<AllMogakModel>();

  final dio = Dio();

  @override
  void onInit() {
    fetchMyTalk();
    fetchCommentTalk();
    fetchMyLikeTalk();
    fetchMyMogak();
    fetchJoinMogak();
    super.onInit();
  }

  Future<void> fetchMyMogak() async {
    try {
      final response = await dio.get(
        ApiRoute.myMogakApi,
        options: Options(headers: {'Authorization': token}),
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonArray = response.data['data'];
        final mogakList = jsonArray
            .map((jsonItem) => AllMogakModel.fromJson(json.encode(jsonItem)))
            .toList();
        // // 데이터를 talkModels 리스트에 추가
        myMogakList.assignAll(mogakList);
        print('모각 데이타 : $mogakList');
      }
    } catch (e) {
      print(' 오류: $e');
    }
  }

  Future<void> fetchJoinMogak() async {
    try {
      final response = await dio.get(
        ApiRoute.myJoinMogakApi,
        options: Options(headers: {'Authorization': token}),
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonArray = response.data['data'];
        final mogakList = jsonArray
            .map((jsonItem) => AllMogakModel.fromJson(json.encode(jsonItem)))
            .toList();
        // // 데이터를 talkModels 리스트에 추가
        myJoinMogakList.assignAll(mogakList);
        print('모각 데이타 : $mogakList');
      }
    } catch (e) {
      print(' 오류: $e');
    }
  }

  Future<void> fetchMyTalk() async {
    try {
      final response = await dio.get(
        ApiRoute.myTalklApi,
        options: Options(headers: {'Authorization': token}),
      );
      if (response.statusCode == 200) {
        var resdata = response.data['data'];

        final List<TalkModel> talkData = resdata
            .map<TalkModel>((jsonItem) => TalkModel.fromMap(jsonItem))
            .toList();
        // // 데이터를 talkModels 리스트에 추가
        myTalkList.assignAll(talkData);
        print('내가 작성한 톡 : $talkData');
      }
    } catch (e) {
      print(' 오류: $e');
    }
  }

  Future<void> fetchCommentTalk() async {
    try {
      final response = await dio.get(
        ApiRoute.myCommentTalklApi,
        options: Options(headers: {'Authorization': token}),
      );
      if (response.statusCode == 200) {
        var resdata = response.data['data'];

        final List<TalkModel> talkData = resdata
            .map<TalkModel>((jsonItem) => TalkModel.fromMap(jsonItem))
            .toList();
        // // 데이터를 talkModels 리스트에 추가
        myCommentTalkList.assignAll(talkData);
        print('이어 달린 톡: $talkData');
      }
    } catch (e) {
      print(' 오류: $e');
    }
  }

  Future<void> fetchMyLikeTalk() async {
    try {
      final response = await dio.get(
        ApiRoute.myLikeTalklApi,
        options: Options(headers: {'Authorization': token}),
      );
      if (response.statusCode == 200) {
        var resdata = response.data['data']['talk'];

        print(resdata);
        final List<TalkModel> talkData = resdata
            .map<TalkModel>((jsonItem) => TalkModel.fromMap(jsonItem))
            .toList();
        // // 데이터를 talkModels 리스트에 추가
        myLikeTalkList.assignAll(talkData);
        print('이어 달린 톡: $talkData');
      }
    } catch (e) {
      print(' 오류: $e');
    }
  }
}
