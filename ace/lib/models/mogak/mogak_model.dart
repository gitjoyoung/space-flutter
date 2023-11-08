import 'dart:convert';

import 'package:ace/models/mogak/appliedProfiles_model.dart';
import 'package:ace/models/mogak/author_model.dart';
import 'package:ace/models/mogak/talk_model.dart';
import 'package:dio/dio.dart';

class AllMogakModel {
  final String id;
  final String title;
  final String content;
  final bool isDeleted;
  final int maxMember;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String authorId;
  final String? hashtag;
  final String visiblityStatus;
  final int temperature;
  final Author? author;
  final List<AppliedProfiles>? appliedProfiles;
  final List<TalkModel>? talks;
  final List? upProfiles;

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
              .map((item) => TalkModel.fromMap(item as Map<String, dynamic>))
              .toList()
          : [], // 추가 (리스트 변환을 위해 적절한 처리 필요)
      upProfiles: map['upProfiles'], // 추가 (리스트 변환을 위해 적절한 처리 필요)
    );
  }

  String toJson() => json.encode(toMap());

  factory AllMogakModel.fromJson(String source) =>
      AllMogakModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

void main() async {
  const token = "clo2moojy0001mg08zd57870v";
  Future<void> fetchData() async {
    try {
      final response =
          await Dio().get('https://dev.sniperfactory.com/api/mogak');

      if (response.statusCode == 200) {
        List<dynamic> jsonArray = response.data['data'];
        List<AllMogakModel> mogakList = jsonArray
            .map((jsonItem) => AllMogakModel.fromJson(json.encode(jsonItem)))
            .toList();
        for (final mogak in mogakList) {
          print( mogak.toMap());
        }
      } else {
        // 요청이 실패하면 예외를 throw합니다.
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // 예외 처리
      throw Exception('Failed to load data: $e');
    }
  }

  try {
    await fetchData();
  } catch (e) {
    print('Error: $e');
  }
}
