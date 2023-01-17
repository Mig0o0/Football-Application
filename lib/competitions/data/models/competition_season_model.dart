import 'package:kora_test_app/competitions/domain/entities/competition_season_entity.dart';

class CompetitionSeasonModel extends CompetitionSeasonEntity {
  const CompetitionSeasonModel({
    required super.id,
    required super.name,
    required super.startDate,
    required super.endDate,
    required super.year,
    required super.competitionId,
  });

  factory CompetitionSeasonModel.fromJson(Map<String, dynamic> json) =>
      CompetitionSeasonModel(
        id: json["id"],
        name: json["name"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        year: json["year"],
        competitionId: json["competition_id"],
      );
}
