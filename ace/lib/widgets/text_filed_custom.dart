import 'package:flutter/material.dart';

import '../utils/colors.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String hintText;
  final String? errorText;
  final TextEditingController controller;

  const TextFormFieldCustom({
    Key? key, // 공개 위젯의 생성자에 'key' 매개변수 추가
    required this.hintText,
    this.errorText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isError = false;
    return TextFormField(
      controller: controller,
      onChanged: (value) {
        // 여기에 로직을 추가할 수 있습니다.
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.neutral50),
        filled: true,
        fillColor: AppColors.strokeLine05,
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.primaryColor, width: 2.0),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.neutral50, width: 2.0),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.strokeLine05, width: 2.0),
          borderRadius: BorderRadius.circular(12),
        ),
        errorText: isError ? errorText : null,
        errorStyle: const TextStyle(fontSize: 13, height: 0.5),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
