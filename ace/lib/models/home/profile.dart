// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:ace/routes/api_route.dart';
import 'package:dio/dio.dart';
// import 'package:get/get.dart';

class ProfileModel {
  final String id;
  final String? nickname;
  final String? bio;
  final String? avatar;
  final String? position;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? urlGithub;
  final String? urlBehance;
  final String? urlBlog;
  final String? urlWeb;
  final String? urlEtc;
  final String? urlPortfolio;
  final String role;
  final String? badgeId;
  final String? accountId;
  final double temperature;

  ProfileModel({
    required this.id,
    this.nickname,
    this.bio,
    this.avatar,
    this.position,
    required this.createdAt,
    required this.updatedAt,
    this.urlGithub,
    this.urlBehance,
    this.urlBlog,
    this.urlWeb,
    this.urlEtc,
    this.urlPortfolio,
    required this.role,
    this.badgeId,
    required this.accountId,
    required this.temperature,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nickname': nickname,
      'bio': bio,
      'avatar': avatar,
      'position': position,
      'createdAt': createdAt?.millisecondsSinceEpoch ,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'urlGithub': urlGithub,
      'urlBehance': urlBehance,
      'urlBlog': urlBlog,
      'urlWeb': urlWeb,
      'urlEtc': urlEtc,
      'urlPortfolio': urlPortfolio,
      'role': role,
      'badgeId': badgeId,
      'accountId': accountId,
      'temperature': temperature,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] as String,
      nickname: map['nickname'] as String?,
      bio:  map['bio']  !=null ?  map['bio'] as String? : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      position: map['position'] != null ? map['position'] as String : null,
      createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt'] as String) : null,
      updatedAt: map['updatedAt'] !=null ?  DateTime.parse(map['updatedAt'] as String) : null,
      urlGithub: map['urlGithub'] != null ? map['urlGithub'] as String : null,
      urlBehance:
          map['urlBehance'] != null ? map['urlBehance'] as String : null,
      urlBlog: map['urlBlog'] != null ? map['urlBlog'] as String : null,
      urlWeb: map['urlWeb'] != null ? map['urlWeb'] as String : null,
      urlEtc: map['urlEtc'] != null ? map['urlEtc'] as String : null,
      urlPortfolio:
          map['urlPortfolio'] != null ? map['urlPortfolio'] as String : null,
      role: map['role'] as String,
      badgeId: map['badgeId'] != null ? map['badgeId'] as String : null,
      accountId: map['accountId'] != null ? map['accountId'] as String : null,
      temperature: (map['temperature'] as num).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
