import 'package:equatable/equatable.dart';

class SeasonTeamEntity extends Equatable {
  final String id;
  final String fullName;
  final String shortName;
  final String abbreviation;

  const SeasonTeamEntity({
    required this.id,
    required this.fullName,
    required this.shortName,
    required this.abbreviation,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    fullName,
    shortName,
    abbreviation
  ];

}
