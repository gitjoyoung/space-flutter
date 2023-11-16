import 'dart:convert';

import 'package:ace/controller/auth/auth_controller.dart';

import 'package:ace/models/catch/my_liked_catch_model.dart';
import 'package:ace/models/mogak/mogak_model.dart';
import 'package:ace/models/talk/talk_model.dart';
import 'package:ace/routes/api_route.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyController extends GetxController {
  String token = Get.find<AuthController>().getToken();

  RxList<TalkModel> myTalkList = RxList<TalkModel>();
  RxList<TalkModel> myCommentTalkList = RxList<TalkModel>();
  RxList<TalkModel> myLikeTalkList = RxList<TalkModel>();

  RxList<AllMogakModel> myMogakList = RxList<AllMogakModel>();
  RxList<AllMogakModel> myJoinMogakList = RxList<AllMogakModel>();
  RxList<MyLikedCatch> myCatchLikedList = RxList<MyLikedCatch>();

  final dio = Dio();

  @override
  void onInit() {
    fetchMyTalk();
    fetchCommentTalk();
    fetchMyLikeTalk();
    fetchMyMogak();
    fetchJoinMogak();
    refreshLikedCatchs();
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

  // Future<void> fetchMyLikeTalks() async {
  //   try {
  //     final response = await dio.get(
  //       ApiRoute.myLikeCatchApi,
  //       options: Options(headers: {'Authorization': token}),
  //     );
  //     if (response.statusCode == 200) {
  //       var resdata = response.data['data'];

  //       print(resdata);
  //       final List<MyLikedCatch> likedCatchData = resdata
  //           .map<MyLikedCatch>((jsonItem) => MyLikedCatch.fromJson(jsonItem))
  //           .toList();
  //       // // 데이터를 talkModels 리스트에 추가
  //       myCatchLikedList.assignAll(likedCatchData);
  //       print('좋아요 한 캐치업: $likedCatchData');
  //     }
  //   } catch (e) {
  //     print(' 오류: $e');
  //   }
  // }

  Future<void> fetchMyLikeCatch(
      String url, RxList<MyLikedCatch> listToUpdate) async {
    Dio dio = Dio();
    try {
      var response = await dio.get(
        ApiRoute.myLikeCatchApi,
        options: Options(headers: {'Authorization': token}),
      );

      if (response.statusCode == 200) {
        // 서버에서 성공적으로 응답을 받았을 때
        List<dynamic> jsonResponse = response.data['data'];
        List<MyLikedCatch> models = List<MyLikedCatch>.from(
            jsonResponse.map((json) => MyLikedCatch.fromJson(json)));
        listToUpdate.assignAll(models);
        print(models);
      } else {
        // 서버 응답에 문제가 있을 때
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // 네트워크 오류 또는 데이터 파싱 중 문제가 발생했을 때
      throw Exception('Error occurred: $e');
    }
  }

  var isLoading = false.obs;
  Future<void> refreshLikedCatchs() async {
    isLoading(true); // 로딩 시작
    try {
      await Future.wait([
        fetchMyLikeCatch(ApiRoute.myLikeCatchApi, myCatchLikedList),
      ]);
      print('좋아요한 캐치업');
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false); // 로딩 종료
    }
  }

  Future<void> launchURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('Could not launch $url');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }
}
