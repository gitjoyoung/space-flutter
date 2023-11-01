import 'package:ace/controller/login_controller.dart';
import 'package:ace/routes/pages.dart';

import 'package:ace/routes/view_route.dart';
import 'package:ace/views/authpage/chang_password_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/authpage/login.dart';
import 'views/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: ViewRoute.mainPage,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => LoginController(), fenix: true);
      }),
      getPages: AppPages.pages,
    );
  }
}
