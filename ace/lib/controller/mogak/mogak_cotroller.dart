import 'dart:convert';

import 'package:ace/models/mogak/mogak_model.dart';
import 'package:ace/routes/api_route.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MogakController extends GetxController {
  RxList<AllMogakModel> allMogakModels = RxList<AllMogakModel>();
  RxList<AllMogakModel> topMogakModels = RxList<AllMogakModel>();
  var isLoading = false.obs;
  final dio = Dio(); // 재사용 가능한 Dio 인스턴스

  Future<bool> fetchListMogak(
      String apiRoute, RxList<AllMogakModel> targetList) async {
    try {
      final response = await dio.get(apiRoute);
      if (response.statusCode == 200) {
        final List<dynamic> jsonArray = response.data['data'];
        for (var item in jsonArray) {
          print(item);
        }
        final mogakList = jsonArray
            .map((jsonItem) => AllMogakModel.fromJson(json.encode(jsonItem)))
            .toList();
        targetList.assignAll(mogakList);
        // print(mogakList.first.talks.toString());

        // for (var mogakItem in mogakList) {
        //   print('Mogak with ID ${mogakItem.id}:');
        //   print('Title: ${mogakItem.title}');
        //   print('Content: ${mogakItem.content}');
        //   print('Max Members: ${mogakItem.authorId}');
        //   print('HashTag: ${mogakItem.hashtag}');
        //   print('Visibility Status: ${mogakItem.visiblityStatus}');
        //   print('Talks:${mogakItem.talks.toString()}');

        //   print('\n'); // 아이템 사이에 공백 추가
        // }
        return true;
      }
      print('모델링 실패: ${response.statusCode}');
      return false;
    } on DioError catch (e) {
      print('Dio 오류: ${e.message}');
      return false;
    } catch (e) {
      print('일반 오류: $e');
      return false;
    }
  }

  String token =
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsbzNrNWRtaDAwMDBtcjA4aG50aWFsYTMiLCJlbWFpbCI6InNuaXBlcmZhY3RvcnlAZ21haWwuY29tIiwidmVyaWZpZWRFbWFpbCI6ZmFsc2UsInZlcmlmaWVkUGhvbmUiOmZhbHNlLCJuYW1lIjoi6rmA7Iqk7YypIiwicHJvZmlsZSI6eyJpZCI6ImNsbzNrN2p4djAwMDFtcjA4dHM4OGIxdzYiLCJuaWNrbmFtZSI6Iuq5gOyKpO2MqeyUqCIsImF2YXRhciI6Imh0dHBzOi8vc25pcGVyZmFjdG9yeS5zMy5hcC1ub3J0aGVhc3QtMi5hbWF6b25hd3MuY29tL2NsbzVmZDVyODAwMDBsNzA4ejhjbWEycnQvc2NyZWVuc2hvdC5wbmciLCJwb3NpdGlvbiI6IkRFVkVMT1BFUiIsInJvbGUiOiJORVdCSUUifSwiaWF0IjoxNjk5MzU2MTk0fQ.b_aXzMeNetKTHy9C0VjZB2xUuLewjdY7hwqj-yQSAME";

  Future<bool> LikeMogak(
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
        return true;
      }
      return false;
    } catch (e) {
      print('like 일반 오류: $e');
      return false;
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

  @override
  void onInit() {
    super.onInit();
    refreshMogaks(); // onInit에서 데이터 새로고침을 호출
  }
}
