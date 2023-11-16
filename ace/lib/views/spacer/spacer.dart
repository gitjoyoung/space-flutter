import 'package:ace/controller/home/home_controller.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/badge_avatar_custom.dart';
import 'package:ace/widgets/card_tag.dart';
import 'package:ace/widgets/spacer/spacer_avatar.dart';
import 'package:ace/widgets/space_appbar.dart';
import 'package:ace/widgets/title_appbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Spacer extends GetView<HomeController> {
  const Spacer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SpaceAppBar(),
        body: SingleChildScrollView(
            child: Container(
          color: AppColors.background5,
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(150), // 왼쪽 아래 코너 라운드 설정
                      bottomRight: Radius.circular(150),
                    ), // 반지름 값 설정 (원의 반지름은 너비와 높이의 절반과 같음)
                    color: AppColors.primary80, // 배경색 설정
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      //상위 타이틀
                      Container(
                        color: Colors.transparent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10.0), // 좌우 패딩 설정
                        height: 68.0, // 일반적인 앱바의 높이
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween, // 요소들을 양 끝으로 정렬
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                                // 뒤로가기 버튼 기능, 예를 들어 Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                'assets/icons/icon20/left.svg',
                                height: 20,
                                width: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text('이달의 스페이서',
                                style: AppTypography.tapButtonBold18
                                    .copyWith(color: Colors.white)),
                            Opacity(
                              opacity: 0, // 오른쪽에 똑같은 공간을 만들기 위해 투명한 아이콘을 넣음
                              child: Icon(
                                Icons.arrow_back,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset("assets/icons/grade/Graphic.svg"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SpacerAvatar(
                            rankList: controller.rankList[1],
                            height: 160,
                            width: 107,
                          ),
                          SpacerAvatar(
                            rankList: controller.rankList[0],
                            height: 182,
                            width: 125,
                          ),
                          SpacerAvatar(
                            rankList: controller.rankList[2],
                            height: 160,
                            width: 107,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
              SizedBox(
                height: 16,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.rankList.length - 3,
                itemBuilder: (context, index) {
                  index += 3;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      children: [
                        Container(
                          height: 90,
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 70,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: AppColors.strokeLine10,
                                      width: 1.0), // 윤곽선 색과 두께 설정
                                  borderRadius:
                                      BorderRadius.circular(10), // 윤곽선 둥글기 설정
                                ),
                                elevation: 0,
                                child: Center(
                                  child: ListTile(
                                    leading: BadgeAvatarCustom(
                                      badge: controller
                                          .rankList[index].profile.role,
                                      avatarUrl: controller
                                          .rankList[index].profile.avatar,
                                      height: 43,
                                      width: 12,
                                    ),
                                    title: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller
                                              .rankList[index].profile.nickname
                                              .toString(),
                                          style: AppTypography.button28Bold,
                                        ),
                                        Tag(
                                          title: controller
                                              .rankList[index].profile.role
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/icon20/like.svg'),
                                        Text(
                                          controller.rankList[index].temperature
                                              .toString(),
                                          style: AppTypography.cardBody
                                              .copyWith(
                                                  color: AppColors.primary80),
                                        ),
                                        SizedBox(
                                          width: 25,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 2,
                          right: 10,
                          child: SvgPicture.asset(
                            'assets/icons/grade/${controller.rankList[index].rank}th.svg',
                            height: 40,
                            width: 28,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        )));
  }
}
