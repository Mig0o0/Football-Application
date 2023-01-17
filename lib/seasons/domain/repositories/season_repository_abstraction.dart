import 'package:dartz/dartz.dart';
import 'package:kora_test_app/core/errors/failure.dart';
import 'package:kora_test_app/seasons/domain/entities/season_team_entity.dart';

abstract class SeasonRepositoryAbstraction{
  Future<Either<Failure, List<SeasonTeamEntity>>> getSeasonTeams(String seasonId);
}