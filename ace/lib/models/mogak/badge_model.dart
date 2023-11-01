import 'dart:convert';

class Badge {
  final String shortName;
  final String fgColor;
  final String bgColor;
  Badge({
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

  factory Badge.fromMap(Map<String, dynamic> map) {
    return Badge(
      shortName: map['shortName'] as String,
      fgColor: map['fgColor'] as String,
      bgColor: map['bgColor'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Badge.fromJson(String source) =>
      Badge.fromMap(json.decode(source) as Map<String, dynamic>);
}
