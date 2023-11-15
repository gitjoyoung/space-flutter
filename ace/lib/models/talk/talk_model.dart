// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ace/models/mogak/author_model.dart';

class TalkModel {
  final String id;
  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? parentId;
  final String authorId;
  final String? catchUpId;
  final String? mogakId;
  final bool isDeleted;
  final int temperature;
  final Author? author;
  final List<TalkModel>? children;
  final int? childrenLength;

  TalkModel({
    required this.id,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.parentId,
    required this.authorId,
    this.catchUpId,
    this.mogakId,
    required this.isDeleted,
    required this.temperature,
    this.author,
    this.children,
    this.childrenLength,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'deletedAt': deletedAt?.millisecondsSinceEpoch,
      'parentId': parentId,
      'authorId': authorId,
      'catchUpId': catchUpId,
      'mogakId': mogakId,
      'isDeleted': isDeleted,
      'temperature': temperature,
      'author': author?.toMap(),
      'children': children?.map((x) => x?.toMap()).toList(),
      'childrenLength': childrenLength,
    };
  }

  factory TalkModel.fromMap(Map<String, dynamic> map) {
    return TalkModel(
      id: map['id'] as String,
      content: map['content'] as String?,
      createdAt:
          map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt:
          map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      deletedAt:
          map['deletedAt'] != null ? DateTime.parse(map['deletedAt']) : null,
      parentId: map['parentId'] as String?,
      authorId: map['authorId'] as String,
      catchUpId: map['catchUpId'] as String?,
      mogakId: map['mogakId'] as String?,
      isDeleted: map['isDeleted'] as bool,
      temperature: map['temperature'] as int,
      author: map['author'] != null ? Author.fromMap(map['author']) : null,
      children: map['children'] != null
          ? (map['children'] as List).map((x) => TalkModel.fromMap(x)).toList()
          : null,
      childrenLength: map['childrenLength'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory TalkModel.fromJson(String source) =>
      TalkModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
