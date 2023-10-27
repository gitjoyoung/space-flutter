// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationView extends GetView {
  static const String route = '/registration';

  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: AppBar(
            iconTheme: IconThemeData(
              color: AppColors.neutral80,
              size: 20,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('회원가입 하기',
                style: AppTypograpy.tapButtonBold18
                    .copyWith(color: AppColors.neutral80)),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity, // 최대 너비 확보
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                '*표시는 필수입력항목 입니다.',
                style: AppTypograpy.cardBody
                    .copyWith(color: AppColors.systemWarnin),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 10.0, right: 10.0),
            child: Row(
              children: [
                Text(
                  '이름',
                  style: AppTypograpy.tapButtonNavgation16
                      .copyWith(color: AppColors.neutral80),
                ),
                SizedBox(width: 4),
                Text(
                  '*',
                  style: TextStyle(color: AppColors.systemWarnin, fontSize: 30),
                ),
                // 아이콘과 텍스트 사이 간격
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              width: 370,
              height: 48,
              child: TextField(
                style: AppTypograpy.button36Regular
                    .copyWith(color: AppColors.neutral80),
                decoration: InputDecoration(
                  hintText: '이름을 입력해주세요',
                  filled: true,
                  fillColor: AppColors.neutral5,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // 테두리 둥근 모서리 설정
                    borderSide: BorderSide.none, // 외곽선 제거
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Text(
                  '이메일',
                  style: AppTypograpy.tapButtonNavgation16
                      .copyWith(color: AppColors.neutral80),
                ),
                SizedBox(width: 4),
                Text(
                  '*',
                  style: TextStyle(color: AppColors.systemWarnin, fontSize: 30),
                ),
                // 아이콘과 텍스트 사이 간격
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              width: 370,
              height: 48,
              child: TextField(
                style: AppTypograpy.button36Regular
                    .copyWith(color: AppColors.neutral80),
                decoration: InputDecoration(
                  hintText: '이메일을 입력해주세요',
                  filled: true,
                  fillColor: AppColors.neutral5,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // 테두리 둥근 모서리 설정
                    borderSide: BorderSide.none, // 외곽선 제거
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Text(
                  '비밀번호',
                  style: AppTypograpy.tapButtonNavgation16
                      .copyWith(color: AppColors.neutral80),
                ),
                SizedBox(width: 4),
                Text(
                  '*',
                  style: TextStyle(color: AppColors.systemWarnin, fontSize: 30),
                ),
                // 아이콘과 텍스트 사이 간격
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              width: 370,
              height: 48,
              child: TextField(
                style: AppTypograpy.button36Regular
                    .copyWith(color: AppColors.neutral80),
                decoration: InputDecoration(
                  hintText: '비밀번호를 입력해주세요',
                  filled: true,
                  fillColor: AppColors.neutral5,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // 테두리 둥근 모서리 설정
                    borderSide: BorderSide.none, // 외곽선 제거
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Text(
                  '휴대전화',
                  style: AppTypograpy.tapButtonNavgation16
                      .copyWith(color: AppColors.neutral80),
                ),
                SizedBox(width: 4),
                Text(
                  '*',
                  style: TextStyle(color: AppColors.systemWarnin, fontSize: 30),
                ),
                // 아이콘과 텍스트 사이 간격
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              width: 370,
              height: 48,
              child: TextField(
                style: AppTypograpy.button36Regular
                    .copyWith(color: AppColors.neutral80),
                decoration: InputDecoration(
                  hintText: '휴대폰 번호를 입력해주세요',
                  filled: true,
                  fillColor: AppColors.neutral5,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // 테두리 둥근 모서리 설정
                    borderSide: BorderSide.none, // 외곽선 제거
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 207), // 위젯 사이의 간격

          TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size(370, 50), // 버튼 크기 설정
              backgroundColor: AppColors.neutral5, // 버튼 배경색 설정
            ),
            onPressed: () {
              // 버튼 클릭시 실행될 함수
            },
            child: Text(
              '가입하기',
              style: AppTypograpy.tapButtonMedium18
                  .copyWith(color: AppColors.neutral20),
            ),
          ),
        ],
      ),
    );
  }
}
