import 'package:ace/controller/talk/talk_controller.dart';
import 'package:ace/models/talk/talk_detail_model.dart';
import 'package:ace/models/talk/talk_model.dart';
import 'package:ace/routes/api_route.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class TalkDetailController extends GetxController {
  Rx<TalkModel?> talkDetail = Rx<TalkModel?>(null);
  final dio = Dio();

  var formatTimeDifference = Get.find<TalkController>().formatTimeDifference;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is TalkModel) {
      talkDetail.value = Get.arguments as TalkModel;
      var id = talkDetail.value?.id ?? '';
      print(id);
      fetchDetailTalk(id);
    } else {
      print("톡톡 디테일 주소 오류");
    }
  }

  Future<void> fetchDetailTalk(String id) async {
    try {
      final response = await dio.get(
        ApiRoute.talkApi + id,
      );
      if (response.statusCode == 200) {
        var resdata = response.data['data']['talk'];
        print('resdata  :' + resdata.toString());
        final TalkDetailModel talks = TalkDetailModel.fromMap(resdata);
        // // 데이터를 talkModels 리스트에 추가
        // talkDetail.value = talks;
        print('댓글이 잘들어 오나?: $talks');
      }
    } catch (e) {
      print('like 일반 오류: $e');
    }
  }
}
