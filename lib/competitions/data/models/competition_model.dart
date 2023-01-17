import 'package:kora_test_app/competitions/data/models/comptetion_category_model.dart';
import 'package:kora_test_app/competitions/domain/entities/competition_entity.dart';

class CompetitionModel extends CompetitionEntity {
  const CompetitionModel({
    required super.id,
    required super.name,
    required super.gender,
    required super.category,
  });


  factory CompetitionModel.fromJson(Map<String, dynamic> json) => CompetitionModel(
      id: json["id"],
      name: json["name"],
      gender: json["gender"],
      category: CompetitionCategoryModel.fromJson(json["category"])
  );
}
