import 'package:flutter/material.dart';

class ImageSizeConfig {
  final BuildContext context;
  late double width;
  late double height;
  late double imageWidth;
  late double imageHeight;

  ImageSizeConfig(this.context) {
    _initConfig();
  }

  void _initConfig() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    imageWidth = width * 0.6;
    imageHeight = height * 0.6;
  }
}
