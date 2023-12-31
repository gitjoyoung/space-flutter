import 'package:ace/controller/auth/auth_controller.dart';
import 'package:ace/controller/auth/avatar_controller.dart';
import 'package:ace/controller/auth/profile_controller.dart';
import 'package:ace/utils/button.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/views/authpage/avatar_setting.dart';
import 'package:ace/widgets/common/text_filed_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Profile extends GetView<ProfileController> {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AvatarController());
    Get.put(AuthController());
    final AvatarController avatarController = Get.find<AvatarController>();
    final ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(top: 89),
              child: Container(
                padding: EdgeInsets.all(15),
                color: Colors.white,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        '*표시는 필수입력항목 입니다.',
                        style: AppTypography.cardBody.copyWith(
                          fontSize: 8,
                          color: AppColors.systemWarnin,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      Wrap(
                        runSpacing: 13.0, // 수직 간격
                        alignment: WrapAlignment.start,

                        children: [
                          Row(
                            children: [
                              Text(
                                '닉네임',
                                style: AppTypography.button28Bold,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '*',
                                style: TextStyle(
                                    color: AppColors.systemWarnin,
                                    fontSize: 24),
                              ),
                            ],
                          ),
                          TextFieldCustom(
                            validator: (p0) {
                              return true;
                            },
                            hintText: '닉네임을 입력해주세요.',
                            errorText: '닉네임이 틀립니다. 다시 한번 입력해주세요.',
                            controller: profileController.nickname,
                          ),
                          const Text(
                            '활동 유형',
                            style: AppTypography.button28Bold,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                //이 코드는 현재 선택된 포지션에 해당하는 키를 groupValue로 설정하여,
                                ////해당 포지션의 라디오 버튼이 선택된 상태로 표시되도록 합니다. 사용자가 다른 라디오 버튼을 선택하면,
                                ///onChanged 콜백이 호출되고 profileController.updatePosition 메서드를 통해 새로운 포지션 값으로 상태가 업데이트됩니다.
                                ///상태가 업데이트되면 Obx 블록 내부의 UI도 새로운 groupValue에 따라 갱신되어 현재 선택된 라디오 버튼이 변경됩니다.
                                child: Obx(
                                  () => RadioListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    title: Text('개발자',
                                        style: AppTypography.button36Regular),
                                    value: '개발자',
                                    groupValue: profileController
                                        .positionMap.entries
                                        .firstWhere(
                                          (entry) =>
                                              entry.value ==
                                              profileController.position.value,
                                          orElse: () => MapEntry('', ''),
                                        )
                                        .key, // 역매핑을 통해 현재 선택된 포지션의 키를 얻습니다.
                                    onChanged: (String? value) {
                                      if (value != null) {
                                        profileController.updatePosition(value);
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Obx(
                                  () => RadioListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    title: Text('디자이너',
                                        style: AppTypography.button36Regular),
                                    value: '디자이너',
                                    groupValue: profileController
                                        .positionMap.entries
                                        .firstWhere(
                                          (entry) =>
                                              entry.value ==
                                              profileController.position.value,
                                          orElse: () => MapEntry('', ''),
                                        )
                                        .key, // 역매핑을 통해 현재 선택된 포지션의 키를 얻습니다.
                                    onChanged: (String? value) {
                                      if (value != null) {
                                        profileController.updatePosition(value);
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Obx(
                                  () => RadioListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    title: Text('헤드헌터',
                                        style: AppTypography.button36Regular),
                                    value: '헤드헌터',
                                    groupValue: profileController
                                        .positionMap.entries
                                        .firstWhere(
                                          (entry) =>
                                              entry.value ==
                                              profileController.position.value,
                                          orElse: () => MapEntry('', ''),
                                        )
                                        .key, // 역매핑을 통해 현재 선택된 포지션의 키를 얻습니다.
                                    onChanged: (String? value) {
                                      if (value != null) {
                                        profileController.updatePosition(value);
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '링크 추가',
                            style: AppTypography.button28Bold,
                          ),
                          TextFieldCustom(
                            validator: (value) {
                              return true;
                            },
                            hintText: 'Linkedin URL/',
                            controller: TextEditingController(),
                          ),
                          TextFieldCustom(
                            validator: (value) {
                              return true;
                            },
                            hintText: 'GitHub URL/',
                            controller: TextEditingController(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFieldCustom(
                                  validator: (value) {
                                    return true;
                                  },
                                  hintText: '개인 웹사이트 URL',
                                  controller: TextEditingController(),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFieldCustom(
                                  validator: (value) {
                                    return true;
                                  },
                                  hintText: '개인 웹사이트 URL',
                                  controller: TextEditingController(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 55,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: AppButton.mediumOutLine,
                              onPressed: () {},
                              child: Text(
                                '초기화',
                                style: AppTypography.tapButtonSubtitle16
                                    .copyWith(color: AppColors.primary60),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              style: AppButton.medium,
                              onPressed: () {
                                // updateProfile 함수를 호출합니다.
                                profileController.updateProfile();
                              },
                              child: Text(
                                '저장하기',
                                style: AppTypography.tapButtonSubtitle16,
                              ),
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            ),
            Transform.translate(
              offset: Offset(0, 30),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() {
                      String avatarUrl = avatarController.avatarUrl.value;
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          if (avatarUrl.isNotEmpty)
                            Image.asset(
                              'assets/profile/avatar_background.png',
                            ),
                          if (avatarUrl.isNotEmpty)
                            CircleAvatar(
                              radius: 50,
                              backgroundColor:
                                  Colors.transparent, // 배경색을 투명으로 설정
                              child: ClipOval(
                                child: Image.network(
                                  avatarUrl,
                                  // 이미지 크기를 조절하세요.

                                  fit: BoxFit.cover, // 이미지를 확대해서 보여주도록 설정
                                ),
                              ),
                            )
                          else
                            Image.asset(
                              'assets/profile/no-avatar.png',
                            ),
                        ],
                      );
                    }),
                    InkWell(
                      onTap: () {
                        Get.dialog(
                          Dialog(
                            child:
                                AvatarCustomizer(), // 여기서 아바타 설정 페이지 위젯을 직접 호출
                          ),
                          barrierDismissible: true, // 모달 창 바깥을 터치하면 닫히도록 설정
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '아바타 수정하기',
                            style: AppTypography.cardBody
                                .copyWith(color: AppColors.primaryColor),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      Colors.grey.withOpacity(0.5), // 그림자의 색상
                                  spreadRadius: 2, // 그림자의 확장 정도
                                  blurRadius: 5, // 그림자의 퍼짐 정도
                                  offset: Offset(0, 3), // 그림자의 위치
                                ),
                              ],
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/Icon30/editable.svg',
                              ),
                            ),
                            // child: CircleAvatar(
                            //   radius: 15,
                            //   // backgroundColor: AppColors.prinary5,
                            //   child: SvgPicture.asset(
                            //     'assets/icons/Icon30/editable.svg',
                            //     width: 30,
                            //     height: 30,
                            //   ),
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
