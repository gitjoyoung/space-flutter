import 'package:ace/controller/my/my_controller.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/common/space_appbar.dart';
import 'package:ace/widgets/common/title_appbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCatchUp extends GetView<MyController> {
  const MyCatchUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpaceAppBar(),
      body: Column(
        children: [
          TitleAppBarCustom(
            title: '내가 쓴 캐치업',
          ),
          SizedBox(height: 100),
          Center(
              child: Text(
            '내가 쓴 캐치업이 없습니다.',
            style: AppTypography.button36Medium,
          )),
        ],
      ),
    );
  }
}
