import 'dart:convert';

import 'package:ace/controller/auth_controller.dart';
import 'package:ace/models/mogak/mogak_model.dart';
import 'package:ace/routes/api_route.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MogakController extends GetxController {

  String token = Get.find<AuthController>().getToken();
  RxList<AllMogakModel> allMogakModels = RxList<AllMogakModel>();
  RxList<AllMogakModel> topMogakModels = RxList<AllMogakModel>();
  var isLoading = false.obs;
  final dio = Dio(); 

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
