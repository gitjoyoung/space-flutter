import 'package:ace/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MogakDetail extends GetView {
  const MogakDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, // 열의 수를 1로 설정하여 수평 스크롤을 만듭니다.
                  ),
                  children: [
                    SvgPicture.asset('assetName'),
                    Text('캐서린'),
                  ],
                ),
                ElevatedButton(
                  style: AppButton.xLarge,
                  onPressed: () {},
                  child: Text('참여하기'),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text('이어달린 톡'),
                GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    children: [
                      Text('작성자 정보'),
                      Card(
                        child: Text(
                            '와 새로운 기능이 정리가 잘 되어있네요! 좋은 정보 공유 감사드립니다! 글을 너무 잘 쓰시는것같아요!'),
                      ),
                      Row(
                        children: [
                          Text('1분전'),
                          IconButton(onPressed: () {}, icon: Icon(Icons.abc),)
                        ],
                      )
                    ])
              ],
            ),
          )
        ],
      ),
    );
  }
}
