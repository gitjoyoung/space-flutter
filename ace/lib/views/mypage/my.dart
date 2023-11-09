import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class My extends StatelessWidget {
  const My({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),

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
                  children: [
                    SizedBox(height: 218),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/Icon20/laptop.svg'),
                        SizedBox(width: 8),
                        Text(
                          '스페이서 달성',
                          style: AppTypography.tapButtonBold18,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons
                              .arrow_back_ios, // The typical icon used for forward action
                          color: Colors.grey, // Icon color
                          size: 16.0, // Icon size
                        ),
                        Icon(
                          Icons
                              .arrow_forward_ios, // The typical icon used for forward action
                          color: Colors.grey, // Icon color
                          size: 16.0, // Icon size
                        ),
                      ],
                    ), // Space at the bottom of the container
                  ],
                ),
              ),
              SizedBox(height: 20), // Space between the two containers
              // Second container with ListView.builder
              Container(
                width: 370,
                height: 246, // Fixed height for the list container
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.strokeLine10,
                    width: 1.0,
                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(19),
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/icon20/letter.svg'),
                          SizedBox(width: 8),
                          Text(
                            '나의 톡!',
                            style: AppTypography.tapButtonBold18,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ListTile(
                        title: Text(
                          '내가쓴톡',
                          style: AppTypography.tapButtonNavgation16
                              .copyWith(color: AppColors.neutral80),
                        ),
                        trailing: Icon(
                          Icons
                              .arrow_forward_ios, // The typical icon used for forward action
                          color: Colors.grey, // Icon color
                          size: 16.0, // Icon size
                        ),
                      ),
                      ListTile(
                        title: Text(
                          '좋아요 한 톡',
                          style: AppTypography.tapButtonNavgation16
                              .copyWith(color: AppColors.neutral80),
                        ),
                        trailing: Icon(
                          Icons
                              .arrow_forward_ios, // The typical icon used for forward action
                          color: Colors.grey, // Icon color
                          size: 16.0, // Icon size
                        ),
                      ),
                      ListTile(
                        title: Text(
                          '내가 쓴 이어달린 톡',
                          style: AppTypography.tapButtonNavgation16
                              .copyWith(color: AppColors.neutral80),
                        ),
                        trailing: Icon(
                          Icons
                              .arrow_forward_ios, // The typical icon used for forward action
                          color: Colors.grey, // Icon color
                          size: 16.0, // Icon size
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 370,
                height: 190,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.strokeLine10,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(19),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/icon20/letter.svg'),
                          SizedBox(width: 8),
                          Text(
                            '나의 캐치업',
                            style: AppTypography.tapButtonBold18,
                          ),
                        ],
                      ),
                      ListTile(
                        title: Text(
                          '내 캐치업',
                          style: AppTypography.tapButtonNavgation16
                              .copyWith(color: AppColors.neutral80),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 16.0,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          '좋아요 한 캐치업',
                          style: AppTypography.tapButtonNavgation16
                              .copyWith(color: AppColors.neutral80),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 370,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.strokeLine10,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(19),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/icon20/letter.svg'),
                          SizedBox(width: 8),
                          Text(
                            '나의 모각코',
                            style: AppTypography.tapButtonBold18,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ListTile(
                        title: Text(
                          '내가 만든 그룹',
                          style: AppTypography.tapButtonNavgation16
                              .copyWith(color: AppColors.neutral80),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 16.0,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          '참여중인 그룹',
                          style: AppTypography.tapButtonNavgation16
                              .copyWith(color: AppColors.neutral80),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 370,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.strokeLine10,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(19),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/Icon20/Setting.svg'),
                          SizedBox(width: 8),
                          Text(
                            '설정',
                            style: AppTypography.tapButtonBold18,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ListTile(
                        title: Text(
                          '내가 정보 수정하기',
                          style: AppTypography.tapButtonNavgation16
                              .copyWith(color: AppColors.neutral80),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 16.0,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          '비밀번호 변경',
                          style: AppTypography.tapButtonNavgation16
                              .copyWith(color: AppColors.neutral80),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 16.0,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          '로그아웃',
                          style: AppTypography.tapButtonNavgation16
                              .copyWith(color: AppColors.neutral80),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 16.0,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          '회원 탈퇴',
                          style: AppTypography.tapButtonNavgation16
                              .copyWith(color: AppColors.neutral80),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Add more widgets if needed
            ],
          ),
        ),
      ),
    );
  }
}
