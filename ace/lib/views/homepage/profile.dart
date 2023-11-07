import 'package:ace/controller/avatar_controller.dart';
import 'package:ace/utils/button.dart';
import 'package:ace/utils/colors.dart';

import 'package:ace/utils/typography.dart';
import 'package:ace/views/authpage/avatar_setting.dart';
import 'package:ace/widgets/text_filed_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetMaterialApp(
    home: Profile(),
  ));
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AvatarController());
    String _selectedValue = '개발자';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Text(
          'data',
          style: TextStyle(color: Colors.black),
        ),
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
                        style: AppTypograpy.cardBody.copyWith(
                          fontSize: 8,
                          color: AppColors.systemWarnin,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      Wrap(
                        runSpacing: 13.0, // 수직 간격
                        alignment: WrapAlignment.start,

                        children: [
                          Text(
                            '닉네임',
                            style: AppTypograpy.button28Bold,
                          ),
                          TextFieldCustom(
                            validator: (p0) {
                              return true;
                            },
                            hintText: '닉네임을 입력해주세요.',
                            errorText: '닉네임이 틀립니다. 다시 한번 입력해주세요.',
                            controller: TextEditingController(),
                          ),
                          const Text(
                            '활동 유형',
                            style: AppTypograpy.button28Bold,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: RadioListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  title: Text('개발자',
                                      style: AppTypograpy.button36Regular),
                                  value: '개발자',
                                  groupValue: _selectedValue,
                                  onChanged: (value) {},
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  title: Text('디자이너',
                                      style: AppTypograpy.button36Regular),
                                  value: '디자이너',
                                  groupValue: _selectedValue,
                                  onChanged: (value) {},
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  title: Text('헤드헌터',
                                      style: AppTypograpy.button36Regular),
                                  value: '헤드헌터',
                                  groupValue: _selectedValue,
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '링크 추가',
                            style: AppTypograpy.button28Bold,
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
                                style: AppTypograpy.tapButtonSubtitle16
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
                              onPressed: () {},
                              child: Text(
                                '저장하기',
                                style: AppTypograpy.tapButtonSubtitle16,
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
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                    ),
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
                            style: AppTypograpy.cardBody
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
