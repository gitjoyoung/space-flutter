import 'package:ace/controller/catch/catch_controller..dart';
import 'package:ace/routes/api_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Talk extends StatelessWidget {
  const Talk({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CatchController());
    return TextButton(
      onPressed: () {
        Get.find<CatchController>().fetchAllCatchModels(ApiRoute.catchApi);
      },
      child: Text('Talk'),
    );
  }
}
