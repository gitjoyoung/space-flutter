import 'package:ace/views/authpage/chang_password_view.dart';
import 'package:ace/views/authpage/find_password.dart';
import 'package:ace/views/authpage/login.dart';
import 'package:ace/views/authpage/registration_page.dart';
import 'package:ace/views/authpage/sign_up_success.dart';
import 'package:ace/views/authpage/splash_page.dart';
import 'package:ace/views/main_view.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: MainView.route, page: () => const MainView()),
    GetPage(name: LoginView.route, page: () => const MainView()),
    GetPage(name: RegistrationView.route, page: () => const RegistrationView()),
    GetPage(name: FindPassword.route, page: () => const FindPassword()),
    GetPage(
        name: ChangePasswordView.route, page: () => const ChangePasswordView()),
    GetPage(name: SplashPage.route, page: () => const SplashPage()),
    GetPage(name: SignUpSuccess.route, page: () => const SignUpSuccess()),
  ];
}
