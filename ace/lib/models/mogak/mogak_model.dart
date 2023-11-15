import 'dart:convert';

import 'package:ace/models/mogak/appliedprofiles_model.dart';
import 'package:ace/models/mogak/author_model.dart';
import 'package:ace/models/mogak/mogak_talk_model.dart';

class AllMogakModel {
  final String id;
  String title;
  String content;
  final bool isDeleted;
  final int maxMember;
  final DateTime createdAt;
  DateTime? updatedAt;
  final DateTime? deletedAt;
  final String authorId;
  String? hashtag;
  String visiblityStatus;
  int temperature;
  Author? author;
  List<AppliedProfiles>? appliedProfiles;
  List<MogakTalkModel>? talks;
  List? upProfiles;

  AllMogakModel({
    required this.id,
    required this.title,
    required this.content,
    required this.isDeleted,
    required this.maxMember,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.authorId,
    required this.hashtag,
    required this.visiblityStatus,
    required this.temperature,
    required this.author,
    required this.appliedProfiles,
    required this.talks,
    required this.upProfiles,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'isDeleted': isDeleted,
      'maxMember': maxMember,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'deletedAt': deletedAt?.millisecondsSinceEpoch,
      'authorId': authorId,
      'hashtag': hashtag,
      'visiblityStatus': visiblityStatus,
      'temperature': temperature,
      'author': author?.toMap(),
      'appliedProfiles': appliedProfiles != null
          ? appliedProfiles!.map((profile) => profile.toMap()).toList()
          : null,
    };
  }

  factory AllMogakModel.fromMap(Map<String, dynamic> map) {
    return AllMogakModel(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      isDeleted: map['isDeleted'],
      maxMember: map['maxMember'],
      createdAt: DateTime.parse(map['createdAt']), // 문자열을 DateTime으로 파싱
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt']) // 문자열을 DateTime으로 파싱
          : null,
      deletedAt: map['deletedAt'] != null
          ? DateTime.parse(map['deletedAt']) // 문자열을 DateTime으로 파싱
          : null,
      authorId: map['authorId'],
      hashtag: map['hashtag'] != null ? map['hashtag'] : null,
      visiblityStatus: map['visiblityStatus'],
      temperature: map['temperature'],
      author: map['author'] != null
          ? Author.fromMap(map['author'] as Map<String, dynamic>)
          : null,
      appliedProfiles: map['appliedProfiles'] != null
          ? (map['appliedProfiles'] as List<dynamic>)
              .map((item) =>
                  AppliedProfiles.fromMap(item as Map<String, dynamic>))
              .toList()
          : null,
      talks: map['talks'] != null
          ? (map['talks'] as List<dynamic>)
              .map((item) => MogakTalkModel.fromMap(item as Map<String, dynamic>))
              .toList()
          : [], // 추가 (리스트 변환을 위해 적절한 처리 필요)
      upProfiles: map['upProfiles'], // 추가 (리스트 변환을 위해 적절한 처리 필요)
    );
  }

  String toJson() => json.encode(toMap());

  void addTalks(List<MogakTalkModel> newTalks) {
    if (this.talks != null) {
      this.talks!.addAll(newTalks);
    } else {
      this.talks = newTalks;
    }
  }

  @override
  String toString() {
    return 'AllMogakModel(id: $id, title: $title, content: $content, '
        'isDeleted: $isDeleted, maxMember: $maxMember, createdAt: $createdAt, '
        'updatedAt: $updatedAt, deletedAt: $deletedAt, authorId: $authorId, '
        'hashtag: $hashtag, visiblityStatus: $visiblityStatus, '
        'temperature: $temperature, author: $author, '
        'appliedProfiles: $appliedProfiles, talks: $talks, upProfiles: $upProfiles)';
  }

  factory AllMogakModel.fromJson(String source) =>
      AllMogakModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
