// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ace/models/auth/profile.dart';

class RankModel {
  int rank;
  int temperature;
  ProfileModel profile;
  RankModel({
    required this.rank,
    required this.temperature,
    required this.profile,
  });

 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rank': rank,
      'temperature': temperature,
      'profile': profile.toMap(),
    };
  }

  factory RankModel.fromMap(Map<String, dynamic> map) {
    return RankModel(
      rank: map['rank'] as int,
      temperature: map['temperature'] as int,
      profile: ProfileModel.fromMap(map['profile'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory RankModel.fromJson(String source) => RankModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
