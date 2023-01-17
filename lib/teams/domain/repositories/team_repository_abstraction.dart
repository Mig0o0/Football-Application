import 'package:dartz/dartz.dart';
import 'package:kora_test_app/core/errors/failure.dart';
import 'package:kora_test_app/teams/domain/entities/team_entity.dart';

abstract class TeamRepositoryAbstraction{
  Future<Either<Failure, List<TeamEntity>>> getTeamInfo(String teamId);
}