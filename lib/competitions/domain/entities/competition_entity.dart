import 'package:equatable/equatable.dart';
import 'package:kora_test_app/competitions/domain/entities/competition_category_entity.dart';

class CompetitionEntity extends Equatable {
  final String id;
  final String name;
  final String gender;
  final CompetitionCategoryEntity category;

  const CompetitionEntity({
    required this.id,
    required this.name,
    required this.gender,
    required this.category,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, gender, category];
}
