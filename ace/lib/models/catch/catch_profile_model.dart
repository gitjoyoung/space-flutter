// import 'dart:convert';

// class CatchProfile {
//   final String id;
//   final String? avatar;
//   final String? nickname;
//   final String role;
//   final String position;
//   final int temperature;

//   CatchProfile({
//     required this.id,
//     this.avatar,
//     this.nickname,
//     required this.role,
//     required this.position,
//     required this.temperature,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'avatar': avatar,
//       'nickname': nickname,
//       'role': role,
//       'position': position,
//       'temperature': temperature,
//     };
//   }

//   String toJson() => json.encode(toMap());

//   factory CatchProfile.fromMap(Map<String, dynamic> map) {
//     return CatchProfile(
//       id: map['id'] as String,
//       avatar: map['avatar'] as String?,
//       nickname: map['nickname'] as String?,
//       role: map['role'] as String,
//       position: map['position'] as String,
//       temperature: map['temperature'],
//     );
//   }

//   factory CatchProfile.fromJson(String source) =>
//       CatchProfile.fromMap(json.decode(source) as Map<String, dynamic>);
// }
