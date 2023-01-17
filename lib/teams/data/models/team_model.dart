import 'package:kora_test_app/teams/domain/entities/team_entity.dart';

class TeamModel extends TeamEntity {
  TeamModel({
    required super.name,
    required super.id,
    required super.country,
    required super.countryCode,
    required super.abbreviation,
    required super.gender,
    required super.jerseys,
    required super.players,
    required super.manager,
    required super.venue,
  });
}
