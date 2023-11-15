import 'package:ace/models/catch/badge_model.dart';

class Author {
  String id;
  String? avatar;
  String? nickname;
  BadgeModel? badge;
  String? role;
  String? position;
  int? temperature;

  Author({
    required this.id,
    this.avatar,
    this.nickname,
    this.badge,
    this.role,
    this.position,
    this.temperature,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      avatar: json['avatar'],
      nickname: json['nickname'],
      badge: json['badge'] != null ? BadgeModel.fromJson(json['badge']) : null,
      role: json['role'],
      position: json['position'],
      temperature: json['temperature'] as int?,
    );
  }
}
