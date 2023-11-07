import 'dart:convert';

import 'package:ace/models/mogak/mogak_model.dart';
import 'package:ace/routes/api_route.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MogakController extends GetxController {
  Rx<String> selectMogak = Rx<String>("");



  RxList<AllMogakModel> allMogakModels = RxList<AllMogakModel>();



  var dio = Dio();

  Future<void> fetchAllMogak() async {
    try {
      final response =
          await Dio().get('https://dev.sniperfactory.com/api/mogak');
      if (response.statusCode == 200) {
        List<dynamic> jsonArray = response.data['data'];
        List<AllMogakModel> mogakList = jsonArray
            .map((jsonItem) => AllMogakModel.fromJson(json.encode(jsonItem)))
            .toList();

        allMogakModels = mogakList.obs;
        // for (final mogak in mogakList) {
        //   print(mogak.toMap());
        // }
      } else {
        throw Exception('모델링 실패');
      }
    } catch (e) {
      throw Exception('통신 실패: $e');
    }
  }

  Future<void> topFive(String mogakId) async {
    var res = await dio.get(ApiRoute.topMogak);
    print(res.data);
  }
// GET
// 단일 모각 가져오기
// https://dev.sniperfactory.com/api/mogak/clo58p1b80000mdccptj78cyy
// 단일 모각 가져오기 api입니다. 단일 모각 안에 댓글, 신청인원, 좋아요 유무 등을 가져오는 기능입니다. 단일 모각을 보려면 토큰값이 필요합니다.

// http://dev.sniperfactory.com/api/mogak/{mogakId}

// GET
// 전체 모각 가져오기
// https://dev.sniperfactory.com/api/mogak
// 전체 모각을 가져오는 API입니다.

// PUT
// 모각 수정하기
// https://dev.sniperfactory.com/api/mogak/clo6jo5j70000ld08uppvxxmy
// 모각을 수정하는 기능입니다. 토큰 값이 필요합니다.

// Request

// content(String - required)
// title(String -required)
// maxMember(int - required)

// DELETE
// 모각 삭제하기
// https://dev.sniperfactory.com/api/mogak/clo6jue4p0001ld08omrifhg7
// 모각을 삭제하는 기능입니다. 토큰 값이 필요합니다.

// http://dev.sniperfactory.com/api/mogak/{mogakId}

// DELETE
// 모각 신청취소하기
// https://dev.sniperfactory.com/api/mogak/clo58p1b80000mdccptj78cyy/apply
// 신청한 모각을 취소하는 기능입니다. 토큰 값이 필요합니다.

// http://dev.sniperfactory.com/api/mogak/{mogakId}/apply
}
