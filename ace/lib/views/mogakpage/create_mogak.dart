import 'package:ace/controller/mogak/mogak_create_contoller.dart';
import 'package:ace/utils/button.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/space_appbar.dart';
import 'package:ace/widgets/tag_row.dart';
import 'package:ace/widgets/title_appbar_custom.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        onChanged: (value) {
                          controller.postTitle(value);
                        },
                        style: AppTypography.tapButtonNavgation16,
                        decoration: InputDecoration(
                          hintStyle: AppTypography.tapButtonNavgation16
                              .copyWith(color: AppColors.neutral20),
                          border: InputBorder.none,
                          hintText: '제목을 입력해주세요.',
                        ),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          controller.postContent(value);
                        },
                        style: AppTypography.button36Regular,
                        keyboardType: TextInputType.multiline,
                        maxLines: null, // 또는 특정 숫자를 지정할 수 있습니다.
                        minLines: 10, // 최소 줄 수를 설정하여 초기 높이를 조절할 수 있습니다.
                        decoration: InputDecoration(
                          hintStyle: AppTypography.button36Regular
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
                        style: AppTypography.button36Regular,
                        decoration: InputDecoration(
                          hintStyle: AppTypography.button36Regular
                              .copyWith(color: AppColors.neutral20),
                          border: InputBorder.none,
                          hintText: '태그를 입력해주세요.',
                        ),
                      ),
                      Obx(() => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: TagsRow(
                              tagsString: controller.postHashTag.value))),
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
                            Get.dialog(
                              Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  width: 242,
                                  height: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, left: 13, right: 13, bottom: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '모집인원',
                                              style:
                                                  AppTypography.tapButtonBold18,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon: Icon(Icons.close),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 38,
                                              height: 38,
                                              decoration: BoxDecoration(
                                                color: AppColors
                                                    .neutral5, // 배경색 설정
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0), // 라운드 모서리 설정
                                              ),
                                              child: Center(
                                                child: SizedBox(
                                                  height: 38,
                                                  child: TextField(
                                                    onChanged: (value) {
                                                      int? parsedValue;
                                                      try {
                                                        parsedValue =
                                                            int.parse(value);
                                                      } catch (e) {
                                                        // 숫자로 변환할 수 없는 경우, 기본값 0으로 설정
                                                        parsedValue = 0;
                                                      }
                                                      // 여기에서 parsedValue를 사용하거나 처리할 작업을 수행합니다.
                                                      controller
                                                          .maxParticipants(
                                                              parsedValue);
                                                    },
                                                    style: AppTypography
                                                        .popupTitleBold,
                                                    textAlign: TextAlign
                                                        .center, // 텍스트 정렬을 가운데로 설정
                                                    maxLines: 1,
                                                    maxLength: 1,
                                                    cursorColor: Colors.black,
                                                    maxLengthEnforcement:
                                                        MaxLengthEnforcement
                                                            .enforced,
                                                    decoration: InputDecoration(
                                                      hintText: '0',
                                                      hintStyle: AppTypography
                                                          .popupTitleBold,
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              bottom: 8),
                                                      focusedBorder: InputBorder
                                                          .none, // 포커스 시 테두리 제거
                                                      enabledBorder: InputBorder
                                                          .none, // 비활성 상태 시 테두리 제거
                                                      counter:
                                                          SizedBox.shrink(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Text(
                                              '명',
                                              style:
                                                  AppTypography.tapButtonBold18,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          title: Text(
                            '모집 인원',
                            style: AppTypography.tapButtonNavgation16,
                          ),
                          trailing: controller.maxParticipants != 0
                              ? RichText(
                                  text: TextSpan(
                                      style: AppTypography.tapButtonNavgation16,
                                      children: [
                                        TextSpan(
                                          text:
                                              '${controller.maxParticipants.toString()}',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
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
                    DottedDashedLine(
                        axis: Axis.horizontal,
                        height: 0,
                        width: 310,
                        dashColor: AppColors.neutral10),
                    ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: () {
                          Get.dialog(Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: 242,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, left: 13, right: 13, bottom: 30),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '모집상태',
                                          style: AppTypography.tapButtonBold18,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: Icon(Icons.close),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Obx(
                                      () => Row(
                                        children: [
                                          Radio(
                                            visualDensity:
                                                VisualDensity(horizontal: -4),
                                            value: 'OPEN',
                                            groupValue: controller
                                                .visiblityStatus
                                                .value, // obs로 감싼 변수 사용
                                            onChanged: (value) {
                                              controller.visiblityStatus.value =
                                                  value.toString();
                                            },
                                          ),
                                          Text('모집중'),
                                        ],
                                      ),
                                    ),
                                    Obx(
                                      () => Row(
                                        children: [
                                          Radio(
                                            visualDensity:
                                                VisualDensity(horizontal: -4),
                                            value: 'CLOSE',
                                            groupValue: controller
                                                .visiblityStatus
                                                .value, // obs로 감싼 변수 사용
                                            onChanged: (value) {
                                              controller.visiblityStatus.value =
                                                  value.toString();
                                            },
                                          ),
                                          Text('모집완료'),
                                        ],
                                      ),
                                    ),
                                    Obx(
                                      () => Row(
                                        children: [
                                          Radio(
                                            visualDensity:
                                                VisualDensity(horizontal: -4),
                                            value: 'HIDDEN',
                                            groupValue: controller
                                                .visiblityStatus
                                                .value, // obs로 감싼 변수 사용
                                            onChanged: (value) {
                                              controller.visiblityStatus.value =
                                                  value.toString();
                                            },
                                          ),
                                          Text('작성중'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                        },
                        title: Text(
                          '모집 상태',
                          style: AppTypography.tapButtonNavgation16,
                        ),
                        trailing: Obx(
                          () {
                            if (controller.visiblityStatus.value != '') {
                              return RichText(
                                text: TextSpan(
                                  style: AppTypography.tapButtonNavgation16,
                                  children: [
                                    TextSpan(
                                      text: controller.visiblityStatus.value,
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Icon(Icons.navigate_next_outlined);
                            }
                          },
                        )),
                    DottedDashedLine(
                        axis: Axis.horizontal,
                        height: 0,
                        width: 310,
                        dashColor: AppColors.neutral10),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.createMogak();
                },
                style: AppButton.xLarge,
                child: Text(
                  '등록하기',
                  style: AppTypography.tapButtonMedium18,
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
