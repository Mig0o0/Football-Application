import 'package:kora_test_app/competitions/domain/entities/competition_category_entity.dart';

class CompetitionCategoryModel extends CompetitionCategoryEntity {
  const CompetitionCategoryModel({
    required super.id,
    required super.name,
  });

  factory CompetitionCategoryModel.fromJson(Map<String, dynamic> json) => CompetitionCategoryModel(id: json['id'], name: json["name"]);
}
