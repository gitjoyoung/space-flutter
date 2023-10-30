// ignore_for_file: prefer_const_constructors

import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({Key? key}) : super(key: key);
<<<<<<< HEAD
=======

=======

>>>>>>> 3604355999b0dfcc6f6d3eec4ca86d64343f07c0

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: SizedBox(
            width: 83,
            height: 13,
            child: SvgPicture.asset(
              'assets/login/spacelogo.svg',
              fit: BoxFit.fitWidth,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Divider(
                height: 0.5, thickness: 0.3, color: AppColors.neutral30),
          ),
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.neutral80,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Expanded(
                    child: Text(
                      '비밀번호 변경',
                      textAlign: TextAlign.center,
                      style: AppTypograpy.tapButtonBold18
                          .copyWith(color: AppColors.neutral80),
                    ),
                  ),
                  SizedBox(width: 48),
                ],
              ),
            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  '현재 비밀번호',
                  style: AppTypograpy.tapButtonNavgation16
                      .copyWith(color: AppColors.neutral80),
                ),
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
                  hintText: '비밀번호',
                  filled: true,
                  fillColor: AppColors.neutral5,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility_outlined),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  '새 비밀번호',
                  style: AppTypograpy.tapButtonNavgation16
                      .copyWith(color: AppColors.neutral80),
                ),
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
                  hintText: '비밀번호',
                  filled: true,
                  fillColor: AppColors.neutral5,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility_outlined),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 313),
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size(370, 50),
              backgroundColor: AppColors.neutral5,
            ),
            onPressed: () {},
            child: Text(
              '변경하기',
              style: AppTypograpy.tapButtonMedium18
                  .copyWith(color: AppColors.neutral20),
            ),
          ),
        ],
      ),
    );
  }
}
