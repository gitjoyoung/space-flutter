import 'package:ace/models/mogak/badge_model.dart';

class MyLikedCatch {
  String id;
  String? profileId;
  String? itemId;
  String? itemType;
  DateTime? createdAt;
  Profile? profile;
  CatchUp? catchUp;

  MyLikedCatch({
    required this.id,
    this.profileId,
    this.itemId,
    this.itemType,
    this.createdAt,
    this.profile,
    this.catchUp,
  });

  factory MyLikedCatch.fromJson(Map<String, dynamic> json) => MyLikedCatch(
        id: json['id'],
        profileId: json['profileId'],
        itemId: json['itemId'],
        itemType: json['itemType'],
        createdAt: DateTime.parse(json['createdAt']),
        profile: Profile.fromJson(json['profile']),
        catchUp: CatchUp.fromJson(json['catchUp']),
      );

  get url => null;
}

class Profile {
  String id;
  String? avatar;
  String? nickname;
  BadgeModels? badge;
  String? role;
  String? position;
  int? temperature;

  Profile({
    required this.id,
    this.avatar,
    this.nickname,
    this.badge,
    this.role,
    this.position,
    this.temperature,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json['id'],
        avatar: json['avatar'],
        nickname: json['nickname'],
        badge:
            json['badge'] != null ? BadgeModels.fromJson(json['badge']) : null,
        role: json['role'],
        position: json['position'],
        temperature: json['temperature'] as int?,
      );
}

class BadgeModels {
  String shortName;
  String? fgColor;
  String? bgColor;

  BadgeModels({
    required this.shortName,
    this.fgColor,
    this.bgColor,
  });

  factory BadgeModels.fromJson(Map<String, dynamic> json) {
    return BadgeModels(
      shortName: json['shortName'],
      fgColor: json['fgColor'],
      bgColor: json['bgColor'],
    );
  }
}

class CatchUp {
  String id;
  String? title;
  String? slug;
  String? content;
  String? url;
  String? thumbnail;
  String? authorId;
  int? temperature;
  String? status;
  DateTime createdAt;
  DateTime? updatedAt;
  String? category;
  String? hashtag;

  CatchUp({
    required this.id,
    this.title,
    this.slug,
    this.content,
    this.url,
    this.thumbnail,
    this.authorId,
    this.temperature,
    this.status,
    required this.createdAt,
    this.updatedAt,
    this.category,
    this.hashtag,
  });

  factory CatchUp.fromJson(Map<String, dynamic> json) => CatchUp(
        id: json['id'],
        title: json['title'],
        slug: json['slug'],
        content: json['content'],
        url: json['url'],
        thumbnail: json['thumbnail'],
        authorId: json['authorId'],
        temperature: json['temperature'] as int?,
        status: json['status'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        category: json['category'],
        hashtag: json['hashtag'],
      );
}
