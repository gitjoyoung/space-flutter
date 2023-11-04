
import 'package:ace/controller/find_password_controller.dart';
import 'package:ace/controller/login_controller.dart';
import 'package:ace/controller/signup_controller.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/views/authpage/chang_password_view.dart';
import 'package:ace/views/authpage/find_password.dart';
import 'package:ace/views/authpage/login.dart';
import 'package:ace/views/authpage/registration_page.dart';
import 'package:ace/views/authpage/sign_up_success.dart';
import 'package:ace/views/authpage/splash_page.dart';
import 'package:ace/views/main_view.dart';
import 'package:ace/views/mogakpage/create_mogak.dart';
import 'package:ace/views/mogakpage/detail_mogak.dart';
import 'package:ace/views/mogakpage/mogak.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: ViewRoute.mainPage, page: () => const MainView()),
    GetPage(
      name: ViewRoute.loginPage,
      page: () => const LoginView(),
      binding: BindingsBuilder(() {
        Get.put(LoginController());
      }),
    ),
    GetPage(
      name: ViewRoute.registrationPage,
      page: () => const RegistrationView(),
      binding: BindingsBuilder(() {
        Get.put(SignUpController());
      }),
    ),
    GetPage(
      name: ViewRoute.findPassword,
      page: () => const FindPassword(),
      binding: BindingsBuilder(() {
        Get.put(FindPasswordController());
      }),
    ),
    GetPage(
        name: ViewRoute.changePasswordPage,
        page: () => const ChangePasswordView()),
    GetPage(name: ViewRoute.splashPage, page: () => const SplashPage()),
    GetPage(name: ViewRoute.signupSuccess, page: () => const SignUpSuccess()),
    GetPage(name: ViewRoute.mogak, page: () => const Mogak()),
    GetPage(name: ViewRoute.mogakDetail, page: () => const MogakDetail()),

    GetPage(name: ViewRoute.mogakCreate, page: () => const MogakCreate()),


  ];
}
