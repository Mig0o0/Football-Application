import 'package:kora_test_app/teams/domain/entities/jersey_entity.dart';
import 'package:kora_test_app/teams/domain/entities/manager_entity.dart';
import 'package:kora_test_app/teams/domain/entities/team_player_entity.dart';
import 'package:kora_test_app/teams/domain/entities/venue_entity.dart';

class TeamEntity {
  final String name;
  final String id;
  final String country;
  final String countryCode;
  final String abbreviation;
  final String gender;
  final List<JerseyEntity> jerseys;
  final List<TeamPlayerEntity> players;
  final ManagerEntity manager;
  final VenueEntity venue;

  TeamEntity({
    required this.name,
    required this.id,
    required this.country,
    required this.countryCode,
    required this.abbreviation,
    required this.gender,
    required this.jerseys,
    required this.players,
    required this.manager,
    required this.venue,
  });
}
