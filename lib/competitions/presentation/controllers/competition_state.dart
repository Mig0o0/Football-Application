import 'package:equatable/equatable.dart';
import 'package:kora_test_app/competitions/domain/entities/competition_entity.dart';
import 'package:kora_test_app/competitions/domain/entities/competition_season_entity.dart';
import 'package:kora_test_app/core/enums/request_status.dart';

class CompetitionState extends Equatable{
  final List<CompetitionEntity> competitions;
  final RequestStatus competitionStatus;
  final String competitionMessage;


  final List<CompetitionSeasonEntity> competitionSeasons;
  final RequestStatus competitionSeasonStatus;
  final String competitionSeasonMessage;


  const CompetitionState({
    this.competitions = const [],
    this.competitionStatus = RequestStatus.loading,
    this.competitionMessage = '',
    this.competitionSeasons = const [],
    this.competitionSeasonStatus = RequestStatus.loading,
    this.competitionSeasonMessage = ''
  });


  CompetitionState copyWith({
    List<CompetitionEntity>? competitions,
    RequestStatus? competitionStatus,
    String? competitionMessage,
    List<CompetitionSeasonEntity>? competitionSeasons,
    RequestStatus? competitionSeasonStatus,
    String? competitionSeasonMessage
  }){
      return CompetitionState(
        competitions: competitions ?? this.competitions,
        competitionStatus: competitionStatus ?? this.competitionStatus,
        competitionMessage: competitionMessage ?? this.competitionMessage,

        competitionSeasons: competitionSeasons ?? this.competitionSeasons,
        competitionSeasonStatus: competitionSeasonStatus ?? this.competitionSeasonStatus,
        competitionSeasonMessage: competitionSeasonMessage ?? this.competitionSeasonMessage
      );
  }


  @override
  // TODO: implement props
  List<Object?> get props => [
    competitions,
    competitionStatus,
    competitionMessage,

    competitionSeasons,
    competitionSeasonStatus,
    competitionSeasonMessage
  ];

}