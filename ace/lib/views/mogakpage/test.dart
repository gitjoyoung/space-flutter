import 'package:ace/models/mogak/mogak_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends GetView {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    final AllMogakModel data = Get.arguments as AllMogakModel;
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(data.toJson())),
    );
  }
}
