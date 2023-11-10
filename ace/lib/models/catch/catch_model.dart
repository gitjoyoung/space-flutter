import 'dart:convert';

class AllCatchModel {
  final String id;
  final String title;
  final String content;
  final String url;
  final String thumbnail;
  final String authorId;
  final int temperature;
  final String status;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String category;
  final String? hashtag;
  final Author? author;
  final List<Profile>? upProfiles;

  AllCatchModel({
    required this.id,
    required this.title,
    required this.content,
    required this.url,
    required this.thumbnail,
    required this.authorId,
    required this.temperature,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
    required this.hashtag,
    required this.author,
    required this.upProfiles,
  });

  factory AllCatchModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('JSON map cannot be null');
    }
    return AllCatchModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      url: json['url'],
      thumbnail: json['thumbnail'],
      authorId: json['authorId'],
      temperature: json['temperature'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      category: json['category'],
      hashtag: json['hashtag'],
      author: json['author'] != null
          ? Author.fromJson(json['author'] as Map<String, dynamic>)
          : null,
      upProfiles: json['upProfiles'] != null
          ? List<Profile>.from(
              (json['upProfiles'] as List).map(
                (x) => Profile.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'url': url,
      'thumbnail': thumbnail,
      'authorId': authorId,
      'temperature': temperature,
      'status': status,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'category': category,
      'hashtag': hashtag, // null일 수 있음
      'author': author?.toJson(), // null일 수 있음
      'upProfiles': upProfiles?.map((x) => x.toJson()).toList(), // null일 수 있음
    };
  }
}

class Author {
  final String id;
  final String? avatar;
  final String nickname;
  final Badge badge;
  final String role;
  final String position;
  final int temperature;

  Author({
    required this.id,
    this.avatar,
    required this.nickname,
    required this.badge,
    required this.role,
    required this.position,
    required this.temperature,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      avatar: json['avatar'],
      nickname: json['nickname'],
      badge: Badge.fromJson(json['badge']),
      role: json['role'],
      position: json['position'],
      temperature: json['temperature'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'avatar': avatar,
      'nickname': nickname,
      'badge': badge.toJson(),
      'role': role,
      'position': position,
      'temperature': temperature,
    };
  }
}

class Badge {
  final String shortName;
  final String fgColor;
  final String bgColor;

  Badge({
    required this.shortName,
    required this.fgColor,
    required this.bgColor,
  });

  factory Badge.fromJson(Map<String, dynamic> json) {
    return Badge(
      shortName: json['shortName'],
      fgColor: json['fgColor'],
      bgColor: json['bgColor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shortName': shortName,
      'fgColor': fgColor,
      'bgColor': bgColor,
    };
  }
}

class Profile {
  final String id;
  final Author profile;

  Profile({
    required this.id,
    required this.profile,
  });

  factory Profile.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Profile JSON cannot be null');
    }
    if (json['profile'] == null) {
      throw ArgumentError('Profile profile cannot be null');
    }
    return Profile(
      id: json['id'] as String,
      profile: Author.fromJson(json['profile'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profile': profile.toJson(),
    };
  }
}
