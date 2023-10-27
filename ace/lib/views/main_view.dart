import 'package:ace/utils/button.dart';
import 'package:ace/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends GetView {
  static const String route = '/main';

  const MainView({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("d"),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),) ,side: BorderSide(color: Colors.red),
            ),),
          ],
        ),
      ),
    );
  }
}
