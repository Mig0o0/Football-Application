import 'package:equatable/equatable.dart';

class CompetitionCategoryEntity extends Equatable{
  final String id;
  final String name;

  const CompetitionCategoryEntity({
    required this.id,
    required this.name,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name
  ];
}
