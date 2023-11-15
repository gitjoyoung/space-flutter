import 'package:ace/controller/auth_controller.dart';
import 'package:ace/models/catch/catch_maode2.dart';
// import 'package:ace/models/catch/catch_model.dart';
import 'package:ace/routes/api_route.dart';
import 'package:ace/routes/view_route.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'dart:convert';

class CatchController extends GetxController {
  String token = Get.find<AuthController>().getToken();

  RxList<AllCatchModel> allCatchModels = RxList<AllCatchModel>();
  RxList<AllCatchModel> topCatchModels = RxList<AllCatchModel>();
  var isLoading = false.obs;
  final dio = Dio();

  // Future<void> fetchListMogak(
  //     String apiRoute, RxList<AllCatchModel> targetList) async {
  //   try {
  //     var response = await dio.get(apiRoute);
  //     // JSON 데이터를 AllCatchModel 리스트로 변환합니다.
  //     List<AllCatchModel> models = (response.data['data'] as List)
  //         .map((item) => AllCatchModel.fromJson(item))
  //         .toList();

  //   } catch (e) {
  //     print('Failed to load data: $e');
  //     throw Exception('Failed to load data: $e');
  //   }
  // }

  Future<void> fetchAllCatchModels(
      String url, RxList<AllCatchModel> listToUpdate) async {
    Dio dio = Dio();
    try {
      var response = await dio.get(url);

      if (response.statusCode == 200) {
        // 서버에서 성공적으로 응답을 받았을 때
        List<dynamic> jsonResponse = response.data['data'];
        List<AllCatchModel> models = List<AllCatchModel>.from(
            jsonResponse.map((json) => AllCatchModel.fromJson(json)));
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

  Future<void> LikeCatch(String catchUpId) async {
    try {
      print('캐치업아이디 ' + catchUpId);
      final response = await dio.post(ApiRoute.catchLikeApi,
          data: {"catchUpId": catchUpId},
          options: Options(headers: {"Authorization": token}));
      if (response.statusCode == 200) {
        var resdata = response.data['data'];
        print('like: $resdata');
      }
    } catch (e) {
      print('like 일반 오류: $e');
    }
  }

  Future<void> refreshCatchs() async {
    isLoading(true); // 로딩 시작
    try {
      await Future.wait([
        fetchAllCatchModels(ApiRoute.catchApi, allCatchModels),
        // fetchAllCatchModels(ApiRoute.catchTopApi, topCatchModels),
      ]);
      print(allCatchModels); // 결과 확인
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false); // 로딩 종료
    }
  }

  @override
  void onInit() {
    super.onInit();
    refreshCatchs(); // onInit에서 데이터 새로고침을 호출
  }
}
