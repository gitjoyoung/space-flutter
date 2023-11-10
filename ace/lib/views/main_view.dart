import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends GetView {
  static const String route = '/main';

  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 10, right: 10),
                child: SingleChildScrollView(
                    child: Column(children: [
                  Container(
                    height: 48,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Icon(Icons.search),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.strokeLine05, width: 2.0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.primaryColor, width: 2.0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: '내용 검색하기',
                      ),
                    ),
                  ),
                ])))));
  }
}
