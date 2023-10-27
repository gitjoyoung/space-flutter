import 'package:ace/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends GetView {
  static const String route = '/main';

  const MainView({super.key});


  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(child: Text('data' ,style: TextStyle(color: textColors.primaryColor)),
      ),
    );
  }
}
