// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ace/models/talk/talk_model.dart';

class TalkDetailModel {
  TalkModel? talk;
  List<TalkModel>? children;
  TalkDetailModel({
    this.talk,
    this.children,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'talk': talk?.toMap(),
      'children': children?.map((x) => x?.toMap()).toList(),
    };
  }

  factory TalkDetailModel.fromMap(Map<String, dynamic> map) {
    return TalkDetailModel(
      talk: map['talk'] != null
          ? TalkModel.fromMap(map['talk'] as Map<String, dynamic>)
          : null,
      children: map['children'] != null
          ? List<TalkModel>.from(
              (map['children'] as List<dynamic>).map<TalkModel?>(
                (x) => TalkModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
  @override
  String toString() {
    return 'TalkDetailModel(talk: $talk, children: $children)';
  }

  String toJson() => json.encode(toMap());

  factory TalkDetailModel.fromJson(String source) =>
      TalkDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
