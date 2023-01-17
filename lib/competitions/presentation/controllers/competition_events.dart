abstract class CompetitionEvent {}

class GetAllCompetitionsEvent extends CompetitionEvent{}

class GetCompetitionSeasonsEvent extends CompetitionEvent{
  final String competitionId;

  GetCompetitionSeasonsEvent({required this.competitionId});

}