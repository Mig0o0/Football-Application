import 'package:dartz/dartz.dart';
import 'package:kora_test_app/competitions/domain/entities/competition_season_entity.dart';
import 'package:kora_test_app/competitions/domain/repositories/base_competition_repository.dart';
import 'package:kora_test_app/core/errors/failure.dart';
import 'package:kora_test_app/core/usecases/abstract_usecase.dart';

class GetCompetitionSeasons implements Usecase<List<CompetitionSeasonEntity>, CompetitionSeasonParameters>{
  final BaseCompetitionRepository competitionRepository;

  GetCompetitionSeasons({required this.competitionRepository});

  @override
  Future<Either<Failure, List<CompetitionSeasonEntity>>> call(CompetitionSeasonParameters parameters) async{
    return await competitionRepository.getCompetitionSeasons(parameters.competitionId);
  }

}

class CompetitionSeasonParameters{
  final String competitionId;

  CompetitionSeasonParameters({required this.competitionId});
}