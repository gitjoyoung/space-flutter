import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Avatar {
  String hair;
  String skin;
  String expression;
  Color color;

  Avatar({
    required this.hair,
    required this.skin,
    required this.expression,
    required this.color,
  });
}

class AvatarController extends GetxController {
  var currentAvatar = Avatar(
    hair: 'defaultHair',
    skin: 'defaultSkin',
    expression: 'defaultExpression',
    color: Colors.black,
  ).obs;

  void updateHair(String hair) => currentAvatar.value.hair = hair;
  void updateSkin(String skin) => currentAvatar.value.skin = skin;
  void updateExpression(String expression) =>
      currentAvatar.value.expression = expression;
  void updateColor(Color color) => currentAvatar.value.color = color;
}
