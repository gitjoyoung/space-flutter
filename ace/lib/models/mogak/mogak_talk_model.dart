// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ace/models/mogak/author_model.dart';

class MogakTalkModel {
  final String id;
   String content;
  final DateTime createdAt;
  DateTime? updatedAt;
  final String? parentId;
  final String authorId;
  final String? catchUpId;
  int temperature;
  final String? mogakId;
  final bool isDeleted;
  final Author author;
  int? childrenLength;
  MogakTalkModel({
    required this.id,
    required this.content,
    required this.createdAt,
    this.updatedAt,
    this.parentId,
    required this.authorId,
    this.catchUpId,
    required this.temperature,
    this.mogakId,
    required this.isDeleted,
    required this.author,
    this.childrenLength,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'parentId': parentId,
      'authorId': authorId,
      'catchUpId': catchUpId,
      'temperature': temperature,
      'mogakId': mogakId,
      'isDeleted': isDeleted,
      'author': author.toMap(),
      'childrenLength': childrenLength,
    };
  }

  factory MogakTalkModel.fromMap(Map<String, dynamic> map) {
    return MogakTalkModel(
      id: map['id'] as String,
      content: map['content'] as String,
      createdAt:
          DateTime.parse(map['createdAt'] as String), // 문자열을 DateTime으로 파싱
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'] as String) // 문자열을 DateTime으로 파싱
          : null,
      parentId: map['parentId'] != null ? map['parentId'] as String : null,
      authorId: map['authorId'] as String,
      catchUpId: map['catchUpId'] != null ? map['catchUpId'] as String : null,
      temperature: map['temperature'] as int,
      mogakId: map['mogakId'] != null ? map['mogakId'] as String : null,
      isDeleted: map['isDeleted'] as bool,
      author: Author.fromMap(map['author'] as Map<String, dynamic>),
      childrenLength: map['childrenLength'] as int?,
    );
  }

  String toJson() => json.encode(toMap());


  factory MogakTalkModel.fromJson(String source) =>
      MogakTalkModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
