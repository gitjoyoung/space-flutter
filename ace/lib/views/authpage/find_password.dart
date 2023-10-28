import 'package:ace/utils/button.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/text_filed_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetMaterialApp(home: FindPassword()));
}

class FindPassword extends GetView {
  const FindPassword({super.key});
  static const String route = '/findpassword';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                print('아이콘 버튼');
              },
              icon: Icon(Icons.arrow_back_ios)),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: AppColors.neutral80,
            size: 20,
          ),
          title: Text('비밀번호 찾기',
              style: AppTypograpy.tapButtonBold18
                  .copyWith(color: AppColors.neutral80))),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '''기존에 가입하신 이메일을 입력하시면, \n 새로운 비밀번호를 보내드립니다.''',
                    style: AppTypograpy.button36Regular,
                  ),
                )),
                SizedBox(
                  height: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '이메일',
                      style: AppTypograpy.button28Bold,
                    ),
                    TextFormFieldCustom(
                        hintText: '이메일을 입력해주세요.',
                        controller: TextEditingController()),
                  ],
                ),
                SizedBox(
                  height: 300,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('보내기'),
                  style: AppButton.xLarge,
                )
              ]),
        ),
      ),
    );
  }
}
