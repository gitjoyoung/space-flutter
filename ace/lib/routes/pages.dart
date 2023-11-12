import 'package:ace/controller/auth_controller.dart';
import 'package:ace/controller/catch/catch_controller..dart';
import 'package:ace/controller/change_password_controller.dart';
import 'package:ace/controller/find_password_controller.dart';
import 'package:ace/controller/home/home_controller.dart';
import 'package:ace/controller/login_controller.dart';
import 'package:ace/controller/mogak/mogak_cotroller.dart';
import 'package:ace/controller/mogak/mogak_create_contoller.dart';
import 'package:ace/controller/mogak/mogak_detail_cotroller.dart';
import 'package:ace/controller/signup_controller.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/views/authpage/chang_password_view.dart';
import 'package:ace/views/authpage/find_password.dart';
import 'package:ace/views/authpage/login.dart';
import 'package:ace/views/authpage/registration.dart';
import 'package:ace/views/authpage/sign_up_success.dart';
import 'package:ace/views/authpage/splash.dart';
import 'package:ace/views/catchpage/catch.dart';
import 'package:ace/views/catchpage/list_catch.dart';

import 'package:ace/views/homepage/home_layout.dart';
import 'package:ace/views/homepage/profile.dart';

import 'package:ace/views/main_view.dart';
import 'package:ace/views/mogakpage/create_mogak.dart';
import 'package:ace/views/mogakpage/detail_mogak.dart';
import 'package:ace/views/mogakpage/list_mogak.dart';
import 'package:ace/views/mogakpage/mogak.dart';
import 'package:ace/views/spacer/spacer.dart';

import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: ViewRoute.mainPage,
      page: () => const MainView(),
      binding: BindingsBuilder(() {
        Get.put(AuthController());
      }),
    ),
    GetPage(
      name: ViewRoute.loginPage,
      page: () => const LoginView(),
      binding: BindingsBuilder(() {
        Get.put(LoginController());
        Get.put(AuthController());
      }),
    ),
    GetPage(
      name: ViewRoute.registrationPage,
      page: () => const RegistrationView(),
      binding: BindingsBuilder(() {
        Get.put(SignUpController());
        Get.put(AuthController());
      }),
    ),
    GetPage(
      name: ViewRoute.findPasswordPage,
      page: () => const FindPassword(),
      binding: BindingsBuilder(() {
        Get.put(FindPasswordController());
      }),
    ),
    GetPage(
        name: ViewRoute.changePasswordPage,
        page: () => const ChangePasswordView(),
        binding: BindingsBuilder(() {
          Get.put(ChangePasswordController());
          Get.put(AuthController());
        })),
    GetPage(name: ViewRoute.splashPage, page: () => const SplashPage()),
    GetPage(
        name: ViewRoute.signupSuccessPage, page: () => const SignUpSuccess()),
    GetPage(name: ViewRoute.profilePage, page: () => const Profile()),

    // 홈페이지
    GetPage(
      name: ViewRoute.homePage,
      page: () => const HomeLayOut(),
      binding: BindingsBuilder(() {
        Get.put(MogakController());
        Get.put(HomeController());
      }),
    ),

// 스페이서
    GetPage(name: ViewRoute.spacerPage, page: () => const Spacer()),

    // 모각
    GetPage(
      name: ViewRoute.mogakPage,
      page: () => const Mogak(),
      binding: BindingsBuilder(() {
        Get.put(MogakController());
      }),
    ),
    GetPage(
      name: ViewRoute.mogakDetailPage,
      page: () => const MogakDetail(),
      binding: BindingsBuilder(() {
        Get.put(MogakDetailController());
      }),
    ),
    GetPage(
      name: ViewRoute.mogakCreatePage,
      page: () => const MogakCreate(),
      binding: BindingsBuilder(() {
        Get.put(MogakCreateController());
      }),
    ),
    GetPage(
      name: ViewRoute.mogakTopListPage,
      page: () => const MogakList(title: '핫한 모각코'),
    ),
    GetPage(
      name: ViewRoute.mogakAllListPage,
      page: () => const MogakList(title: '모든 모각코'),
    ),
    GetPage(
      name: ViewRoute.catchPage,
      page: () => const Catch(),
      binding: BindingsBuilder(() {
        Get.put(CatchController());
      }),
    ),
    GetPage(
      name: ViewRoute.catchlAllListPage,
      page: () => const CatchList(title: '핫한 캐치업'),
    ),
    GetPage(
      name: ViewRoute.catchlTopListPage,
      page: () => const CatchList(title: '캐치업!'),
    ),
  ];
}
