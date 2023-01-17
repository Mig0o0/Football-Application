import 'package:dartz/dartz.dart';
import 'package:kora_test_app/competitions/domain/entities/competition_entity.dart';
import 'package:kora_test_app/competitions/domain/repositories/base_competition_repository.dart';
import 'package:kora_test_app/core/errors/failure.dart';
import 'package:kora_test_app/core/usecases/abstract_parameters.dart';
import 'package:kora_test_app/core/usecases/abstract_usecase.dart';

class GetAllCompetitions implements Usecase<List<CompetitionEntity>, NoParameters>{
  final BaseCompetitionRepository repository;

  GetAllCompetitions({required this.repository});

  @override
  Future<Either<Failure, List<CompetitionEntity>>> call(NoParameters parameters) async{
    return await repository.getAllCompetitions();
  }

}

