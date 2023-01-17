import 'package:equatable/equatable.dart';

class CompetitionSeasonEntity extends Equatable {
  final String id;
  final String name;
  final String startDate;
  final String endDate;
  final String year;
  final String competitionId;

  const CompetitionSeasonEntity({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.year,
    required this.competitionId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
    startDate,
    endDate,
    year,
    competitionId
  ];
}
