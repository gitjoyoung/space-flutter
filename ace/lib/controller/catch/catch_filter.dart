import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/catch/catch_filter_botton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void showCustomDialog(BuildContext context) {
  RxString selectedFilter = ''.obs;

  void updateFilter(String filter) {
    if (selectedFilter.value == filter) {
      selectedFilter.value = '전체'; // 이미 선택된 필터를 다시 클릭하면 '전체'로 리셋
    } else {
      selectedFilter.value = filter;
    }
  }

  Get.defaultDialog(
      title: '0',
      titlePadding: EdgeInsets.all(0),
      titleStyle: TextStyle(fontSize: 1), // 타이틀을 비웁니다.
      content: Container(
          width: 242,
          height: 405,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  // 타이틀 바처럼 보이도록 Row 위젯을 사용합니다.
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '필터',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Get.back(),
                    ),
                  ],
                ),
                // '필터' 텍스트 아래에 추가적인 내용을 넣습니다.
                Padding(
                  padding: const EdgeInsets.only(top: 28.0), // 상단 여백 추가
                  child: Text(
                    '날짜',
                    style: AppTypography.button36Medium, // 사용자 지정 텍스트 스타일
                  ),
                ),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.start, // 버튼들을 왼쪽으로 정렬
                    children: <Widget>[
                      FilterButton(
                        width: 37,
                        height: 24,
                        text: '전체',
                        isSelected: selectedFilter.value == '전체',
                        onTap: () => updateFilter('전체'),
                      ),
                      SizedBox(width: 8), // 버튼 사이의 간격
                      FilterButton(
                        width: 57,
                        height: 24,
                        text: '오름차순',
                        isSelected: selectedFilter.value == '오름차순',
                        onTap: () => updateFilter('오름차순'),
                      ),
                      SizedBox(width: 8), // 버튼 사이의 간격
                      FilterButton(
                        width: 57,
                        height: 24,
                        text: '내림차순',
                        isSelected: selectedFilter.value == '내림차순',
                        onTap: () => updateFilter('내림차순'),
                      ),
                    ],
                  ),
                ),
                // '필터' 텍스트 아래에 추가적인 내용을 넣습니다.
                Padding(
                  padding: const EdgeInsets.only(top: 28.0), // 상단 여백 추가
                  child: Text(
                    '이름',
                    style: AppTypography.button36Medium, // 사용자 지정 텍스트 스타일
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start, // 버튼들을 왼쪽으로 정렬
                  children: <Widget>[
                    FilterButton(
                      width: 37,
                      height: 24,
                      text: '전체',
                      isSelected: selectedFilter.value == '전체',
                      onTap: () => selectedFilter.value = '전체',
                    ),
                    SizedBox(width: 8), // 버튼 사이의 간격
                    FilterButton(
                      width: 57,
                      height: 24,
                      text: '오름차순',
                      isSelected: selectedFilter.value == '오름차순',
                      onTap: () => selectedFilter.value = '오름차순',
                    ),
                    SizedBox(width: 8), // 버튼 사이의 간격
                    FilterButton(
                      width: 57,
                      height: 24,
                      text: '내림차순',
                      isSelected: selectedFilter.value == '내림차순',
                      onTap: () => selectedFilter.value = '내림차순',
                    ),
                  ],
                ),

                // '필터' 텍스트 아래에 추가적인 내용을 넣습니다.
                Padding(
                  padding: const EdgeInsets.only(top: 28.0), // 상단 여백 추가
                  child: Text(
                    '좋아요',
                    style: AppTypography.button36Medium, // 사용자 지정 텍스트 스타일
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start, // 버튼들을 왼쪽으로 정렬
                  children: <Widget>[
                    FilterButton(
                      width: 50,
                      height: 24,
                      text: '많은 순',
                      isSelected: selectedFilter.value == '많은 순',
                      onTap: () => selectedFilter.value = '많은 순',
                    ),
                    SizedBox(width: 8), // 버튼 사이의 간격
                    FilterButton(
                      width: 50,
                      height: 24,
                      text: '적은 순',
                      isSelected: selectedFilter.value == '적은 순',
                      onTap: () => selectedFilter.value = '적은 순',
                    ), // 버튼 사이의 간격
                  ],
                ),
                SizedBox(height: 27), // 버튼 사이의 간격
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // 자식들을 가운데로 정렬
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(110, 24),
                        side: BorderSide(color: AppColors.primary80),
                      ),
                      child: Text(
                        '초기화',
                        style: AppTypography.cardBody
                            .copyWith(color: AppColors.primary80),
                      ),
                    ),
                    SizedBox(width: 10), // 버튼 사이의 간격
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(110, 24),
                        primary: AppColors.primary80,
                      ),
                      child: Text(
                        '확인',
                        style: AppTypography.cardBody
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ])));
}
