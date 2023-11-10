// import 'package:ace/models/catch/catch_model.dart';

// class Author {
//   final String id;
//   final String nickname;
//   final String avatar;
//   final Badge badge;
//   final String role;
//   final String position;
//   final int temperature;

//   Author({
//     required this.id,
//     required this.nickname,
//     required this.avatar,
//     required this.badge,
//     required this.role,
//     required this.position,
//     required this.temperature,
//   });

//   factory Author.fromJson(Map<String, dynamic> json) {
//     return Author(
//       id: json['id'] as String,
//       nickname: json['nickname'] as String,
//       avatar: json['avatar'] as String,
//       badge: Badge.fromJson(json['badge']),
//       role: json['role'] as String,
//       position: json['position'] as String,
//       temperature: json['temperature'] as int,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'nickname': nickname,
//       'avatar': avatar,
//       'badge': badge.toJson(),
//       'role': role,
//       'position': position,
//       'temperature': temperature,
//     };
//   }
// }
