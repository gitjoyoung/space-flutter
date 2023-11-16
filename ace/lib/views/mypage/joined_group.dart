import 'package:ace/controller/my/my_controller.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/widgets/common/space_appbar.dart';
import 'package:ace/widgets/common/title_appbar_custom.dart';
import 'package:ace/widgets/mogak/mogak_content.dart';
import 'package:ace/widgets/talk/talk_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JoindeGroups extends GetView<MyController> {
  const JoindeGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpaceAppBar(),
      body: RefreshIndicator(
        onRefresh: () => controller.fetchJoinMogak(),
        child: Column(children: [
          TitleAppBarCustom(
            title: '참여중인 그룹',
          ),
          ElevatedButton(
              onPressed: () {
                controller.fetchJoinMogak();
              },
              child: Text('테스트버튼')),
          Obx(() => Expanded(
                child: ListView.builder(
                  itemCount: controller.myJoinMogakList.length,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: AppColors.strokeLine10, width: 1.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MogakContent(
                          data: controller.myJoinMogakList[index],
                          maxLength: 5,
                        ));
                  },
                ),
              ))
        ]),
      ),
    );
  }
}
