import 'dart:convert';

class BadgeModel {
  final String shortName;
  final String fgColor;
  final String bgColor;
  BadgeModel({
    required this.shortName,
    required this.fgColor,
    required this.bgColor,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shortName': shortName,
      'fgColor': fgColor,
      'bgColor': bgColor,
    };
  }

  factory BadgeModel.fromMap(Map<String, dynamic> map) {
    return BadgeModel(
      shortName: map['shortName'] as String,
      fgColor: map['fgColor'] as String,
      bgColor: map['bgColor'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BadgeModel.fromJson(String source) =>
      BadgeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
