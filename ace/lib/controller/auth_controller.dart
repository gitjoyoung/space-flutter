import 'package:ace/model/user.dart';
import 'package:ace/routes/api_route.dart';
import 'package:ace/views/authpage/login.dart';
import 'package:ace/views/main_view.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn<User>();
  Dio dio = Dio();

  //userd의 private한 것을 사용할 수 있게 가져오기
  User? get user => _user.value;

  login(String id, String pw) async {
    var res = await dio.post(ApiRoute.baseUrl + ApiRoute.login,
        data: {'email': id, 'password': pw});
    if (res.statusCode == 200) {
      var data = Map<String, dynamic>.from(res.data);
      _user(User.fromMap(data));
      print(res.data);
    }
  }

  signup() {}

  logout() {
    _user.value = null;
  }

  _handleAuthChanged(User? data) {
    if (data != null) {
      //메인페이지 이동
      Get.toNamed(MainView.route);

      return;
    }
    //로그인 페이지로 이동
    Get.toNamed(LoginView.route);

    return;
  }

  @override
  void onInit() {
    ever(_user, _handleAuthChanged);
    super.onInit();
  }
}
