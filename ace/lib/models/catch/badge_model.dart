class BadgeModel {
  String shortName;
  String? fgColor;
  String? bgColor;

  BadgeModel({
    required this.shortName,
    this.fgColor,
    this.bgColor,
  });

  factory BadgeModel.fromJson(Map<String, dynamic> json) {
    return BadgeModel(
      shortName: json['shortName'],
      fgColor: json['fgColor'],
      bgColor: json['bgColor'],
    );
  }
}
