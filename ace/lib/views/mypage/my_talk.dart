import 'package:ace/controller/my/my_controller.dart';
import 'package:ace/widgets/common/space_appbar.dart';
import 'package:ace/widgets/common/title_appbar_custom.dart';
import 'package:ace/widgets/talk/talk_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTalk extends GetView<MyController> {
  const MyTalk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpaceAppBar(),
      body: Column(children: [
        TitleAppBarCustom(
          title: '내가 쓴 톡',
        ),
        ElevatedButton(
            onPressed: () {
              controller.fetchMyMogak();
            },
            child: Text('테스트버튼')),
        Obx(() => Expanded(
              child: ListView.builder(
                itemCount: controller.myTalkList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, right: 10, left: 10),
                    child: CustomTalkWidget(
                        talkModel: controller.myTalkList[index]),
                  );
                },
              ),
            ))
      ]),
    );
  }
}
