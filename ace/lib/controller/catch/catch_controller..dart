import 'package:ace/controller/auth_controller.dart';
import 'package:ace/models/catch/catch_maode2.dart';
// import 'package:ace/models/catch/catch_model.dart';
import 'package:ace/routes/api_route.dart';
import 'package:ace/routes/view_route.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CatchController extends GetxController {
  String token = Get.find<AuthController>().getToken();

  RxList<AllCatchModel> allCatchModels = RxList<AllCatchModel>();
  RxList<AllCatchModel> topCatchModels = RxList<AllCatchModel>();
  var isLoading = false.obs;
  final dio = Dio();

  Future<List<AllCatchModel>> fetchAllCatchModels(String endpoint) async {
    try {
      var response = await dio.get(endpoint);
      // JSON 데이터를 AllCatchModel 리스트로 변환합니다.
      List<AllCatchModel> models = (response.data['data'] as List)
          .map((item) => AllCatchModel.fromJson(item))
          .toList();
      return models;
    } catch (e) {
      print('Failed to load data: $e');
      throw Exception('Failed to load data: $e');
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
    isLoading(true);
    try {
      // 모든 "catch" 모델 데이터를 가져와서 상태를 업데이트합니다.
      allCatchModels.assignAll(await fetchAllCatchModels(ApiRoute.catchApi));
      // 상위 "catch" 모델 데이터를 가져와서 상태를 업데이트합니다.
      topCatchModels.assignAll(await fetchAllCatchModels(ApiRoute.catchTopApi));
      print('Data loaded successfully.');
    } catch (e) {
      print('Failed to load data: $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    refreshCatchs(); // onInit에서 데이터 새로고침을 호출
  }
}

final Dio _dio = Dio();

Future<List<AllCatchModel>> getBlogPosts() async {
  try {
    final response = await _dio.get('YOUR_API_ENDPOINT');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((json) => AllCatchModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load blog posts');
    }
  } on DioError catch (e) {
    // DioError를 처리하는 방법
    print(e);
    throw Exception('Failed to load blog posts: ${e.message}');
  }
}
