import 'package:get/get.dart';

class MogakCreateController extends GetxController {

  RxString postTitle = RxString(''); // 제목
  RxString postContent = RxString(''); // 내용
  RxInt maxParticipants = RxInt(0); // 최대 참여 인원
  RxString recruitmentStatus = RxString('모집중'); // 모집 상태
}
