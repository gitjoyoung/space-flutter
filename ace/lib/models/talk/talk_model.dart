// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ace/models/catch/catch_maode2.dart';



class TalkModel {
  String id;
  String content;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  String? parentId;

  String authorId;
  String? catchUpId;
  String? mogakId;
  String isDeleted;
  int temperature;
  Author? author;
  // list? upProfiles;
  int? childrenLength;
  TalkModel({
    required this.id,
    required this.content,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.authorId,
    this.parentId,
    this.catchUpId,
    this.mogakId,
    required this.isDeleted,
    required this.temperature,
    required this.author,
    // required this.upProfiles,
    required this.childrenLength,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'deletedAt': deletedAt?.millisecondsSinceEpoch,
      'authorId': authorId,
      'parentId': parentId,
      'catchUpId': catchUpId,
      'mogakId': mogakId,
      'isDeleted': isDeleted,
      'temperature': temperature,
      'author': author?.toMap(),
      // 'upProfiles': upProfiles,
      'childrenLength': childrenLength,
    };
  }

  factory TalkModel.fromMap(Map<String, dynamic> map) {
    return TalkModel(
      id: map['id'] as String,
      content: map['content'] as String,
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'] as String)
          : null,
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'] as String)
          : null,
      deletedAt: map['deletedAt'] != null
          ? DateTime.parse(map['deletedAt'] as String)
          : null,
      authorId: map['authorId'] as String,
      parentId: map['parentId'] != null ? map['parentId'] as String : null,
      catchUpId: map['catchUpId'] != null ? map['catchUpId'] as String : null,
      mogakId: map['mogakId'] != null ? map['mogakId'] as String : null,
      isDeleted: map['isDeleted'] as String,
      temperature: map['temperature'] as int,
      author: map['author'] != null
          ? Author.fromMap(map['author'] as Map<String, dynamic>)
          : null,
      // upProfiles: map['upProfiles'],
      childrenLength:
          map['childrenLength'] != null ? map['childrenLength'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TalkModel.fromJson(String source) =>
      TalkModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
