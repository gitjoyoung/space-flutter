class TokenModel {
  final String id;
  final String email;
  final bool verifiedEmail;
  final bool verifiedPhone;
  final String name;
  final Profile? profile;
  final int iat;

  TokenModel({
    required this.id,
    required this.email,
    required this.verifiedEmail,
    required this.verifiedPhone,
    required this.name,
    required this.profile,
    required this.iat,
  });

  factory TokenModel.fromMap(Map<String, dynamic> json) {
    return TokenModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      verifiedEmail: json['verifiedEmail'] ?? false,
      verifiedPhone: json['verifiedPhone'] ?? false,
      name: json['name'] ?? '',
      profile: Profile.fromMap(json['profile']),
      iat: json['iat'] ?? 0,
    );
  }
}

class Profile {
  final String? id;
  final String? nickname;
  final String? avatar;
  final String? position;
  final String? role;

  Profile({
    required this.id,
    required this.nickname,
    required this.avatar,
    required this.position,
    required this.role,
  });

  factory Profile.fromMap(Map<String, dynamic>? json) {
    return Profile(
      id: json?['id'] ?? '',
      nickname: json?['nickname'] ?? '',
      avatar: json?['avatar'] ?? '',
      position: json?['position'] ?? '',
      role: json?['role'] ?? '',
    );
  }
}
