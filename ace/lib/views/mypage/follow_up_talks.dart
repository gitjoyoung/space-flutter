import 'package:ace/controller/my/my_controller.dart';
import 'package:ace/widgets/common/space_appbar.dart';
import 'package:ace/widgets/common/title_appbar_custom.dart';
import 'package:ace/widgets/talk/talk_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowUpTalks extends GetView<MyController> {
  const FollowUpTalks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpaceAppBar(),
      body: Column(children: [
        TitleAppBarCustom(
          title: '내가 쓴 이어달린 톡',
        ),
        Obx(() => Expanded(
              child: ListView.builder(
                itemCount: controller.myCommentTalkList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, right: 10, left: 10),
                    child: CustomTalkWidget(
                        talkModel: controller.myCommentTalkList[index]),
                  );
                },
              ),
            ))
      ]),
    );
  }
}
