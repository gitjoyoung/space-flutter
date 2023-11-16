import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/common/my_page.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class My extends StatelessWidget {
  const My({super.key});

  @override
  Widget build(BuildContext context) {
// Get.put(AvatarController());
    // Get.put(AuthController());
    // final AvatarController avatarController = Get.find<AvatarController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              Container(
                width: 370,
                height: 420,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.strokeLine10,
                    width: 1.0,
                  ),
                ),
                child: Column(
                  // physics: NeverScrollableScrollPhysics(),
                  // shrinkWrap: true, //ListView가 자신의 내용에 맞춰서 크기를 조절
                  children: [
                    Container(
                      height: 150,
                      width: 200,
                      child: SvgPicture.asset(
                        "assets/item/myavatar.svg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16),
                    DottedDashedLine(
                        axis: Axis.horizontal,
                        height: 0,
                        width: 310,
                        dashColor: AppColors.neutral10),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/Icon20/laptop.svg"),
                        SizedBox(width: 8),
                        Text(
                          '스페이서 달성',
                          style: AppTypography.tapButtonBold18,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: 370,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.grey,
                              size: 16.0,
                            ),
                            Container(
                              height: 120,
                              width: 200,
                              child: SvgPicture.asset(
                                "assets/item/mypage.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              myPageCustom(
                  width: 370,
                  height: 249,
                  headerTitle: '나의 톡!',
                  svgAssetPath: 'assets/icons/icon20/fire.svg',
                  titles: ['내가 쓴 톡', '좋아요 한 톡', '내가 쓴 이어달린 톡']),
              SizedBox(height: 16),
              myPageCustom(
                  width: 370,
                  height: 193,
                  headerTitle: '나의 캐치업!',
                  svgAssetPath: 'assets/icons/icon20/dart.svg',
                  titles: ['내 캐치업', '좋아요 한 캐치업']),
              SizedBox(height: 16),
              myPageCustom(
                  width: 370,
                  height: 193,
                  headerTitle: '나의 모칵코!',
                  svgAssetPath: 'assets/icons/icon20/dart.svg',
                  titles: ['내가 만든 그룹', '참여중인 그룹']),
              SizedBox(height: 16),
              myPageCustom(
                  width: 370,
                  height: 305,
                  headerTitle: '설정',
                  svgAssetPath: 'assets/icons/icon20/Setting.svg',
                  titles: ['내 정보 수정하기', '비밀번호 변경', '로그아웃', '회원탈퇴'])
            ],
          ),
        ),
      ),
    );
  }
}
