import 'package:dartz/dartz.dart';
import 'package:kora_test_app/core/errors/failure.dart';
import 'package:kora_test_app/core/usecases/abstract_usecase.dart';
import 'package:kora_test_app/seasons/domain/entities/season_team_entity.dart';
import 'package:kora_test_app/seasons/domain/repositories/season_repository_abstraction.dart';

class GetSeasonTeams implements Usecase<List<SeasonTeamEntity>, SeasonTeamParameters>{
  final SeasonRepositoryAbstraction seasonRepository;

  GetSeasonTeams({required this.seasonRepository});

  @override
  Future<Either<Failure, List<SeasonTeamEntity>>> call(SeasonTeamParameters parameters) async{
    return await seasonRepository.getSeasonTeams(parameters.seasonId);
  }
}

class SeasonTeamParameters{
  final String seasonId;

  SeasonTeamParameters({required this.seasonId});

}