// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import '../mogak/author_model.dart';

import 'package:ace/models/mogak/badge_model.dart';
import 'package:ace/models/token_model.dart';

class AppliedProfiles {
  String id;
  String? avatar;
  String? nickname;
  String role;
  String position;
  BadgeModel? badge;
  int temperature;
  Profile? profile;
  AppliedProfiles({
    required this.id,
    this.avatar,
    this.nickname,
    required this.role,
    required this.position,
    this.badge,
    required this.temperature,
    this.profile,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'avatar': avatar,
      'nickname': nickname,
      'role': role,
      'position': position,
      'badge': badge?.toMap(),
      'temperature': temperature,
      // 'profile': profile?.toMap(),
    };
  }

  factory AppliedProfiles.fromMap(Map<String, dynamic> map) {
    return AppliedProfiles(
      id: map['id'] as String,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      nickname: map['nickname'] != null ? map['nickname'] as String : null,
      role: map['role'] as String,
      position: map['position'] as String,
      badge: map['badge'] != null
          ? BadgeModel.fromMap(map['badge'] as Map<String, dynamic>)
          : null,
      temperature: map['temperature'] as int,
      profile: map['profile'] != null
          ? Profile.fromMap(map['profile'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppliedProfiles.fromJson(String source) =>
      AppliedProfiles.fromMap(json.decode(source) as Map<String, dynamic>);
}
