import 'package:ace/utils/typography.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class TextFieldCustom extends StatefulWidget {
  final String hintText;
  final String? errorText;
  final TextEditingController controller;
  final bool? password;
  final bool Function(String)? validator;

  const TextFieldCustom({
    Key? key, // 공개 위젯의 생성자에 'key' 매개변수 추가
    required this.hintText,
    this.errorText,
    required this.controller,
    this.password,
    this.validator,
  }) : super(key: key);

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool obscure = true;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.password == true ? obscure : false,
      controller: widget.controller,
      onChanged: (value) {
        if (widget.validator != null) {
          var isValid = widget.validator!(value);
          setState(() {
            isError = !isValid;
          });
        }
      },
      decoration: InputDecoration(
        suffixIcon: widget.password == true
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                icon: const Icon(Icons.remove_red_eye_outlined))
            : null,
        hintText: widget.hintText,
        hintStyle:
            AppTypograpy.button36Medium.copyWith(color: AppColors.neutral50),
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
        errorText: isError ? widget.errorText : null,
        errorStyle: AppTypograpy.cardBody.copyWith(height: 0.3),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
