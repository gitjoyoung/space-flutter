import 'package:ace/controller/auth_controller.dart';
import 'package:ace/routes/pages.dart';
import 'package:ace/routes/view_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: ViewRoute.splashPage,
      getPages: AppPages.pages,
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
      }),
    );
  }
}
