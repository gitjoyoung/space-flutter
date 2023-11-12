import 'package:ace/controller/home/home_controller.dart';
import 'package:ace/widgets/space_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Spacer extends StatelessWidget {
  const Spacer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: SpaceAppBar(), body: Center(child: Text('스페이서')));
  }
}
