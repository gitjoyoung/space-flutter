import 'package:ace/controller/auth_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var pwController = TextEditingController();

  login() {
    Get.find<AuthController>().login(emailController.text, pwController.text);
  }
}
