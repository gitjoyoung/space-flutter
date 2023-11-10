import 'package:ace/controller/auth_controller.dart';
import 'package:ace/models/catch/catch_model.dart';
import 'package:ace/routes/api_route.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CatchController extends GetxController {
  String token = Get.find<AuthController>().getToken();
  RxList<AllCatchModel> allCatchModels = RxList<AllCatchModel>();
  RxList<AllCatchModel> topCatchModels = RxList<AllCatchModel>();
  var isLoading = false.obs;
  final dio = Dio();

  Future<void> fetchListCatch(
      String url, RxList<AllCatchModel> targetList) async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final responseData = response.data['data'];
        if (responseData == null) {
          targetList.clear();
          return;
        }
        if (responseData is! List) {
          throw Exception(
              'Expected a list but got ${responseData.runtimeType}');
        }

        final List<AllCatchModel> fetchedCatchs = [];
        for (var json in responseData) {
          if (json == null) {
            // 로그에 null 데이터가 있음을 기록
            print('Null data encountered in the list');
            continue; // 리스트의 다음 항목으로 건너뛰기
          }
          if (json is! Map<String, dynamic>) {
            // 로그에 유효하지 않은 타입의 데이터가 있음을 기록
            print(
                'Invalid data type encountered: Expected a Map but got ${json.runtimeType}');
            continue; // 리스트의 다음 항목으로 건너뛰기
          }
          fetchedCatchs.add(AllCatchModel.fromJson(json));
        }
        targetList.assignAll(fetchedCatchs);
      } else {
        throw Exception('Failed to load data: HTTP ${response.statusCode}');
      }
    } on DioError catch (dioError) {
      throw Exception('Dio error: ${dioError.message}');
    } catch (e) {
      throw Exception('Error: $e');
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
      // 각각의 API로부터 데이터를 가져와서 리스트를 업데이트합니다.
      await fetchListCatch(ApiRoute.catchApi, allCatchModels);
      await fetchListCatch(ApiRoute.catchTopApi, topCatchModels);
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
