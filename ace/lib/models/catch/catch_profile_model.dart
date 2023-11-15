import 'package:ace/models/catch/author_model.dart';

class Profile {
  String id;
  Author? profile;

  Profile({
    required this.id,
    this.profile,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      profile: Author.fromJson(json['profile']),
    );
  }
}
