import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("test")),
        body: Center(
          child: CustomModalButton(
            titleText: "로그인에 실패하였습니다.",
            contentText: "다시 시도해주세요.",
          ),
        ),
      ),
    );
  }
}

class CustomModalController extends GetxController {
  void showModal(String titleText, String contentText, IconData iconData,
      Color iconColor) {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.all(24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              size: 50,
              color: iconColor,
            ),
            SizedBox(height: 16),
            Text(
              titleText,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(contentText),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("다시하기"),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomModalButton extends StatelessWidget {
  final String titleText;
  final String contentText;
  final IconData iconData;
  final Color iconColor;

  CustomModalButton({
    required this.titleText,
    required this.contentText,
    this.iconData = Icons.warning,
    this.iconColor = Colors.blue,
  });

  final CustomModalController _controller = Get.put(CustomModalController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            _controller.showModal(titleText, contentText, iconData, iconColor);
          },
          child: Text("모달창 보기"),
        ),
        ElevatedButton(
          onPressed: () {
            Get.dialog(CustomDialog(
              titleText: titleText,
              contentText: contentText,
              iconData: iconData,
              iconColor: iconColor,
            ));
          },
          child: Text('test'),
        ),
      ],
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String titleText;
  final String contentText;
  final IconData iconData;
  final Color iconColor;

  const CustomDialog({
    required this.titleText,
    required this.contentText,
    this.iconData = Icons.warning,
    this.iconColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            size: 50,
            color: iconColor,
          ),
          SizedBox(height: 16),
          Text(
            titleText,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(contentText),
        ],
      ),
      // actions: [
      //   Center(
      //     child: ElevatedButton(
      //       onPressed: () {
      //         Get.back();
      //       },
      //       child: Text("다시하기"),
      //     ),
      //   ),
      // ],
    );
  }
}
