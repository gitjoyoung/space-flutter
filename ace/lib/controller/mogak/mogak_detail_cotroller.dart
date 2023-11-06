import 'package:get/get.dart';

class MogakDetailController extends GetxController {
  RxString userName = RxString('우디');
  RxString userTag = RxString('수료생');
  RxBool isLiked = RxBool(false);
  RxString postTitle = RxString('[모집중] 모각코 팀을 모집합니다');
  RxString postContent = RxString('저희는 유니티로 개발을 공부해서...');
  RxString postDate = RxString('2023.09.04');
  RxInt currentParticipants = RxInt(3);
  RxInt maxParticipants = RxInt(4);

  void toggleLike() {
    isLiked.value = !isLiked.value;
  }
}
