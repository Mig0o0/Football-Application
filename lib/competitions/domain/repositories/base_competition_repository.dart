import 'package:dartz/dartz.dart';
import 'package:kora_test_app/competitions/domain/entities/competition_entity.dart';
import 'package:kora_test_app/competitions/domain/entities/competition_season_entity.dart';
import 'package:kora_test_app/core/errors/failure.dart';

abstract class BaseCompetitionRepository{
  Future<Either<Failure, List<CompetitionEntity>>> getAllCompetitions();
  Future<Either<Failure, List<CompetitionSeasonEntity>>> getCompetitionSeasons(String competitionId);
}