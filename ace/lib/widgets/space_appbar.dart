import 'package:ace/controller/home/home_controller.dart';
import 'package:ace/routes/view_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

AppBar SpaceAppBar() {
  final HomeController homeController = Get.find<HomeController>();

  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0.5,
    backgroundColor: Colors.white,
    title: InkWell(
      onTap: () {
        homeController.goToHome();
        print('Logo tapped');
      },
      child: SvgPicture.asset('assets/login/spacelogo.svg'),
    ),
  );
}
