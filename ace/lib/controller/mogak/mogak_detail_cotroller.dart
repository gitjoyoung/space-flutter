import 'dart:convert';

import 'package:ace/models/mogak/mogak_model.dart';
import 'package:ace/routes/api_route.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MogakDetailController extends GetxController {
  RxBool isLiked = RxBool(false);
  RxString visiblityStatus = RxString('OPEN'); // 모집 상태
  RxString postContent = RxString('저희는 유니티로 개발을 공부해서...');
  RxList<AllMogakModel> mogakDetail = RxList<AllMogakModel>();

  var isLoading = true.obs;
  void toggleLike() {
    isLiked.value = !isLiked.value;
  }

  late String id;

  var dio = Dio();

  Future<void> fetchMogakDetail(String id) async {
    isLoading(true);
    final url = 'https://dev.sniperfactory.com/api/mogak/$id';
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsonArray = response.data['data'];
        List<AllMogakModel> mogakList = jsonArray
            .map((jsonItem) => AllMogakModel.fromJson(json.encode(jsonItem)))
            .toList();

        for (final mogak in mogakList) {
          print(mogak.toMap());
        }
        mogakDetail.assignAll(mogakList); // 응답 데이터를 옵저버블 변수에 할당합니다.
      } else {
        // 에러 처리
        print('Failed to load mogak detail');
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> editMogak() async {
    var res = await dio.get(ApiRoute.mogak, data: {
      // "title": "모각코 이름 변경 테스트",
      "content": postContent,
      // "maxMember": 4,
      "visiblityStatus": visiblityStatus
    });
    print(res.data);
  }

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments as String;
    fetchMogakDetail(id);
  }
}
