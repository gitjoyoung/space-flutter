import 'package:ace/controller/mogak/mogak_create_contoller.dart';
import 'package:ace/utils/button.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/modal_costom.dart';
import 'package:ace/widgets/space_appbar.dart';
import 'package:ace/widgets/tag_row.dart';
import 'package:ace/widgets/title_appbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MogakCreate extends GetView<MogakCreateController> {
  const MogakCreate({super.key});

  void showCustomDialog() {
    Get.defaultDialog(
      title: '모집인원', // 이미지에 나타난 제목
      titleStyle: TextStyle(fontSize: 16), // 제목 스타일을 조정하세요
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "그룹에 참여하시겠습니까?",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold), // 여기서 스타일을 원하는 대로 조정하세요
        ),
      ),
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, // 버튼 색상을 조정하세요
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // 버튼 모서리를 둥글게 조정하세요
          ),
        ),
        onPressed: () {
          Get.back(); // 참여하기 버튼 클릭시 실행될 동작
        },
        child: Text('참여하기'),
      ),
      cancel: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // 버튼 모서리를 둥글게 조정하세요
          ),
        ),
        onPressed: () {
          Get.back(); // 취소 버튼 클릭시 실행될 동작
        },
        child: Text('취소'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(MogakCreateController());
    return Scaffold(
      appBar: SpaceAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(children: [
            TitleAppBarCustom(title: '그룹 만들기'),
            Card(
              elevation: 0, // 그림자 제거
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: AppColors.strokeLine10, width: 1.0), // 윤곽선 색과 두께 설정
                borderRadius: BorderRadius.circular(10), // 윤곽선 둥글기 설정
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 24, left: 16, right: 16, bottom: 24),
                child: Column(children: [
                  TextField(
                    onChanged: (value) {
                      controller.postTitle(value);
                    },
                    style: AppTypograpy.tapButtonNavgation16,
                    decoration: InputDecoration(
                      hintStyle: AppTypograpy.tapButtonNavgation16
                          .copyWith(color: AppColors.neutral20),
                      border: InputBorder.none,
                      hintText: '제목을 입력해주세요.',
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      controller.postContent(value);
                    },
                    style: AppTypograpy.button36Regular,
                    keyboardType: TextInputType.multiline,
                    maxLines: null, // 또는 특정 숫자를 지정할 수 있습니다.
                    minLines: 10, // 최소 줄 수를 설정하여 초기 높이를 조절할 수 있습니다.
                    decoration: InputDecoration(
                      hintStyle: AppTypograpy.button36Regular
                          .copyWith(color: AppColors.neutral20),
                      hintText: '내용을 입력해주세요.',
                      border: InputBorder.none,
                    ),
                    validator: (value) {},
                  ),
                  TextField(
                    onChanged: (value) {
                      controller.postHashTag(value);
                    },
                    style: AppTypograpy.button36Regular,
                    decoration: InputDecoration(
                      hintStyle: AppTypograpy.button36Regular
                          .copyWith(color: AppColors.neutral20),
                      border: InputBorder.none,
                      hintText: '태그를 입력해주세요.',
                    ),
                  ),
                  Obx(() => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child:
                          TagsRow(tagsString: controller.postHashTag.value))),
                ]),
              ),
            ),
            Card(
              elevation: 0, // 그림자 제거
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: AppColors.strokeLine10, width: 1.0), // 윤곽선 색과 두께 설정
                borderRadius: BorderRadius.circular(10), // 윤곽선 둥글기 설정
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Obx(() => ListTile(
                          contentPadding: EdgeInsets.zero,
                          onTap: () {
                            showCustomDialog();
                            // ModalCostom(
                            //   context,
                            //   '로그인에 실패했습니다',
                            //   '다시시도해주세요',
                            //   Icons.warning,
                            //   AppColors
                            //       .prinary80, // 색상 이름이 AppColors.prinary80에서 AppColors.primary80로 수정되었습니다.
                            //   '다시하기',
                            //   () {
                            //     Get.back();
                            //   },
                            // );
                          },
                          title: Text(
                            '모집 인원',
                            style: AppTypograpy.tapButtonNavgation16,
                          ),
                          trailing: controller.maxParticipants != 0
                              ? RichText(
                                  text: TextSpan(
                                      style: AppTypograpy.tapButtonNavgation16,
                                      children: [
                                        TextSpan(
                                          text:
                                              '${controller.maxParticipants.toString()}',
                                          style: TextStyle(
                                            color: AppColors
                                                .primaryColor, // 여기에 원하는 색상을 지정하세요.
                                          ),
                                        ),
                                        TextSpan(
                                            text: "명",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ]),
                                ) // maxParticipants가 0이 아닌 경우 텍스트로 표시
                              : Icon(Icons.navigate_next_outlined),
                        )),
                    Divider(),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {
                        showCustomDialog();
                      },
                      title: Text(
                        '모집 상태',
                        style: AppTypograpy.tapButtonNavgation16,
                      ),
                      trailing: controller.visiblityStatus == '모집중'
                          ? RichText(
                              text: TextSpan(
                                  style: AppTypograpy.tapButtonNavgation16,
                                  children: [
                                    TextSpan(
                                      text: '모집중',
                                      style: TextStyle(
                                        color: AppColors
                                            .primaryColor, // 여기에 원하는 색상을 지정하세요.
                                      ),
                                    ),
                                  ]),
                            ) // maxParticipants가 0이 아닌 경우 텍스트로 표시
                          : Icon(Icons.navigate_next_outlined),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {},
                style: AppButton.xLarge,
                child: Text(
                  '등록하기',
                  style: AppTypograpy.button36Bold,
                )),
            SizedBox(
              height: 115,
            ),
          ]),
        ),
      ),
    );
  }
}
