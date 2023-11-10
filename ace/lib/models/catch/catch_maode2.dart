import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AllCatchModel {
  final String id;
  final String title;
  final String content;
  final String url;
  final String thumbnail;
  final String authorId;
  final int temperature;
  final String status;
  // final DateTime createdAt;
  // final DateTime? updatedAt;
  // final String category;
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
    // required this.createdAt,
    // this.updatedAt,
    // required this.category,
    this.hashtag,
    this.author,
    this.upProfiles,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'url': url,
      'thumbnail': thumbnail,
      'authorId': authorId,
      'temperature': temperature,
      'status': status,
      // 'createdAt': createdAt.millisecondsSinceEpoch,
      // 'updatedAt': updatedAt?.millisecondsSinceEpoch,
      // 'category': category,
      'hashtag': hashtag,
      'author': author?.toMap(),
      'upProfiles': upProfiles?.map((x) => x.toMap()).toList(),
    };
  }

  factory AllCatchModel.fromMap(Map<String, dynamic> map) {
    return AllCatchModel(
      id: map['id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      url: map['url'] as String,
      thumbnail: map['thumbnail'] as String,
      authorId: map['authorId'] as String,
      temperature: map['temperature'] as int,
      status: map['status'] as String,
      // createdAt: DateTime.parse(map['createdAt'] as String),
      // updatedAt: map['updatedAt'] != null
      //     ? DateTime.parse(map['updatedAt'] as String)
      //     : null,
      // category: map['category'] as String,
      hashtag: map['hashtag'] as String?,
      author: map['author'] != null
          ? Author.fromMap(map['author'] as Map<String, dynamic>)
          : null,
      upProfiles: (map['upProfiles'] as List<dynamic>?)
          ?.map((x) => Profile.fromMap(x as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AllCatchModel.fromJson(String source) =>
      AllCatchModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Author {
  final String id;
  final String? avatar;
  final String nickname;
  final Badge? badge;
  final String role;
  final String position;

  Author({
    required this.id,
    this.avatar,
    required this.nickname,
    required this.badge,
    required this.role,
    required this.position,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'avatar': avatar,
      'nickname': nickname,
      'badge': badge?.toMap(),
      'role': role,
      'position': position,
    };
  }

  factory Author.fromMap(Map<String, dynamic> map) {
    return Author(
      id: map['id'] as String,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      nickname: map['nickname'] as String,
      badge: map['badge'] != null
          ? Badge.fromMap(map['badge'] as Map<String, dynamic>)
          : null,
      role: map['role'] as String,
      position: map['position'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Author.fromJson(String source) =>
      Author.fromMap(json.decode(source) as Map<String, dynamic>);
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

class Profile {
  final String id;
  final Author profile;
  Profile({
    required this.id,
    required this.profile,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'profile': profile.toMap(),
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] as String,
      profile: Author.fromMap(map['profile'] as Map<String, dynamic>),
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Profile.fromJson(String source) =>
  //     Profile.fromMap(json.decode(source) as Map<String, dynamic>);
}
