import 'package:ace/model/user.dart';
import 'package:ace/routes/api_route.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn<User>();
  Dio dio = Dio();

  login(String email, String pw) async {
    var res = await dio.post(ApiRoute.baseUrl + ApiRoute.login);
    if (res.statusCode == 200) {}
  }

  signup() {}

  logout() {
    _user.value = null;
  }

  _handleAuthChanged(User? data) {
    if (data != null) {
      //Get.to
      //메인페이지 이동
      return;
    }
    //로그인 페이지로 이동
    return;
  }

  @override
  void onInit() {
    ever(_user, _handleAuthChanged);
    super.onInit();
  }
}
