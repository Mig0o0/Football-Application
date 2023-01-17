import 'package:equatable/equatable.dart';
import 'package:kora_test_app/core/enums/request_status.dart';
import 'package:kora_test_app/seasons/domain/entities/season_team_entity.dart';

class SeasonState extends Equatable {
  final List<SeasonTeamEntity> teams;
  final RequestStatus seasonStatus;
  final String seasonMessage;

  const SeasonState({
    this.teams = const [],
    this.seasonStatus = RequestStatus.loading,
    this.seasonMessage = '',
  });

  SeasonState copyWith({
    List<SeasonTeamEntity>? teams,
    RequestStatus? seasonStatus,
    String? seasonMessage,
  }) {
    return SeasonState(
        teams: teams ?? this.teams,
        seasonStatus: seasonStatus ?? this.seasonStatus,
        seasonMessage: seasonMessage ?? this.seasonMessage);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        teams,
        seasonStatus,
        seasonMessage,
      ];
}
