import 'package:kora_test_app/seasons/domain/entities/season_team_entity.dart';

class SeasonTeamModel extends SeasonTeamEntity {
  const SeasonTeamModel({
    required super.id,
    required super.fullName,
    required super.shortName,
    required super.abbreviation,
  });

  factory SeasonTeamModel.fromJson(Map<String, dynamic> json) => SeasonTeamModel(id: json['id'], fullName: json['name'], shortName: json['short_name'], abbreviation: json['abbreviation'],);
}
