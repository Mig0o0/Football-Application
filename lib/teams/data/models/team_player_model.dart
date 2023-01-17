import 'package:kora_test_app/teams/domain/entities/team_player_entity.dart';

class TeamPlayerModel extends TeamPlayerEntity {
  TeamPlayerModel({
    required super.id,
    required super.name,
    required super.type,
    required super.dateOfBirth,
    required super.nationality,
    required super.countryCode,
    required super.height,
    required super.weight,
    required super.jerseyNumber,
    required super.preferredFoot,
    required super.placeOfBirth,
    required super.gender,
  });

  factory TeamPlayerModel.fromJson(Map<String, dynamic> json) =>
      TeamPlayerModel(
        id: id,
        name: name,
        type: type,
        dateOfBirth: dateOfBirth,
        nationality: nationality,
        countryCode: countryCode,
        height: height,
        weight: weight,
        jerseyNumber: jerseyNumber,
        preferredFoot: preferredFoot,
        placeOfBirth: placeOfBirth,
        gender: gender,
      );
}
