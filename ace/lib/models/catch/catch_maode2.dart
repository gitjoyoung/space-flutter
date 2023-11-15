class AllCatchModel {
  String id;
  String title;
  String? slug;
  String content;
  String url;
  String thumbnail;
  String? authorId;
  int? temperature;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? category;
  String? hashtag;
  Author? author;
  List<Profile>? upProfiles;

  AllCatchModel({
    required this.id,
    required this.title,
    this.slug,
    required this.content,
    required this.url,
    required this.thumbnail,
    this.authorId,
    this.temperature,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.hashtag,
    this.author,
    this.upProfiles,
  });

  factory AllCatchModel.fromJson(Map<String, dynamic> json) {
    return AllCatchModel(
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
      author: json['author'] != null ? Author.fromJson(json['author']) : null,
      upProfiles: List<Profile>.from(
          json['upProfiles'].map((x) => Profile.fromJson(x))),
    );
  }
  @override
  String toString() {
    return 'AllCatchModel{id: $id, title: $title, slug: $slug, content: $content, url: $url, thumbnail: $thumbnail, authorId: $authorId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, category: $category, hashtag: $hashtag}';
  }
}

class Author {
  String id;
  String? avatar;
  String? nickname;
  Badge? badge;
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
      badge: json['badge'] != null ? Badge.fromJson(json['badge']) : null,
      role: json['role'],
      position: json['position'],
      temperature: json['temperature'] as int?,
    );
  }
}

class Badge {
  String shortName;
  String fgColor;
  String? bgColor;

  Badge({
    required this.shortName,
    required this.fgColor,
    this.bgColor,
  });

  factory Badge.fromJson(Map<String, dynamic> json) {
    return Badge(
      shortName: json['shortName'],
      fgColor: json['fgColor'],
      bgColor: json['bgColor'],
    );
  }
}

class Profile {
  String id;
  Author? profile;

  Profile({
    required this.id,
    this.profile,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      profile: Author.fromJson(json['profile']),
    );
  }
}
