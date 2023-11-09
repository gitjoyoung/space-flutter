import 'package:ace/controller/home/home_controller.dart';
import 'package:ace/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          controller.token,
          style: AppTypography.button28Medium,
        ),
      ],
    );
  }
}
