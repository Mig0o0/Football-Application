abstract class SeasonEvent{}

class GetSeasonTeamsEvent extends SeasonEvent{
  final String seasonId;

  GetSeasonTeamsEvent({required this.seasonId});
}