import 'package:ace/controller/auth_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var idController = TextEditingController();
  var pwController = TextEditingController();

  login() {
    Get.find<AuthController>().login(idController.text, pwController.text);
  }
}
