// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ace/models/mogak/author_model.dart';

class TalkModel {
  final String id;
  final String content;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? parentId;
  final String authorId;
  final String? catchUpId;
  final int temperature;
  final String? mogakId;
  final bool isDeleted;
  final Author author;
  TalkModel({
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
    };
  }

  factory TalkModel.fromMap(Map<String, dynamic> map) {
    return TalkModel(
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
    );
  }

  String toJson() => json.encode(toMap());
  @override
  String toString() {
    return 'TalkModel(id: $id, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, '
        'parentId: $parentId, authorId: $authorId, catchUpId: $catchUpId, temperature: $temperature, '
        'mogakId: $mogakId, isDeleted: $isDeleted, author: $author)';
  }

  factory TalkModel.fromJson(String source) =>
      TalkModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
