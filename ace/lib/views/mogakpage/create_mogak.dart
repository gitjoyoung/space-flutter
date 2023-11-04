import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/card_tag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MogakCreate extends GetView {
  const MogakCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('그룹 만들기')),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 10, right: 10),
        child: Column(children: [
          ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            title: Text('구룹 만들기'),
            trailing: Icon(Icons.navigate_next_outlined),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 16, right: 16, bottom: 16),
              child: Column(children: [
                TextField(
                  style: AppTypograpy.tapButtonNavgation16,
                  decoration: InputDecoration(
                    hintStyle: AppTypograpy.tapButtonNavgation16
                        .copyWith(color: AppColors.neutral20),
                    border: InputBorder.none,
                    hintText: '제목을 입력해주세요.',
                  ),
                ),
                TextFormField(
                  style: AppTypograpy.button36Regular,
                  keyboardType: TextInputType.multiline,
                  maxLines: null, // 또는 특정 숫자를 지정할 수 있습니다.
                  minLines: 10, // 최소 줄 수를 설정하여 초기 높이를 조절할 수 있습니다.
                  decoration: InputDecoration(
                    hintStyle: AppTypograpy.button36Regular
                        .copyWith(color: AppColors.neutral20),
                    hintText: '내용을 입력해주세요.',
                    border: InputBorder.none,
                  ),
                  validator: (value) {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Tag(title: '# 수료생'),
                    Tag(title: '# 수료생'),
                    Tag(title: '# 수료생'),
                  ],
                ),
              ]),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {},
                    title: Text('모집 인원'),
                    trailing: Icon(Icons.navigate_next_outlined),
                  ),
                  Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {},
                    title: Text('모집 상태'),
                    trailing: Icon(Icons.navigate_next_outlined),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
