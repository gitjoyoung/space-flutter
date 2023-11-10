import 'dart:convert';

import 'package:ace/models/mogak/badge_model.dart';

class Author {
  final String id;
  final String? avatar; // 아바타 이미지 URL
  final String nickname;
  final BadgeModel? badge;
  final String? role;
  Author(
      {required this.id,
      required this.avatar,
      required this.nickname,
      required this.badge,
      required this.role});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'avatar': avatar,
      'nickname': nickname,
      'badge': badge?.toMap(),
    };
  }

  factory Author.fromMap(Map<String, dynamic> map) {
    return Author(
      id: map['id'] as String,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      nickname: map['nickname'] as String,
      badge: map['badge'] != null
          ? BadgeModel.fromMap(map['badge'] as Map<String, dynamic>)
          : null,
      role: map['role'] != null ? map['role'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());
  @override
  String toString() {
    return 'Author(id: $id, avatar: $avatar, nickname: $nickname, badge: $badge, role: $role)';
  }

  factory Author.fromJson(String source) =>
      Author.fromMap(json.decode(source) as Map<String, dynamic>);
}
