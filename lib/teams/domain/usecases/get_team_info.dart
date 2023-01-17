import 'package:dartz/dartz.dart';
import 'package:kora_test_app/core/errors/failure.dart';
import 'package:kora_test_app/teams/domain/entities/team_entity.dart';
import 'package:kora_test_app/teams/domain/repositories/team_repository_abstraction.dart';

import '../../../core/usecases/abstract_usecase.dart';

class GetTeamInfo implements Usecase<List<TeamEntity>, TeamInfoParameter>{
  final TeamRepositoryAbstraction teamRepository;

  GetTeamInfo({required this.teamRepository});

  @override
  Future<Either<Failure, List<TeamEntity>>> call(TeamInfoParameter parameters) async{
    return await teamRepository.getTeamInfo(parameters.teamId);
  }
}

class TeamInfoParameter{
  final String teamId;
  TeamInfoParameter({required this.teamId});
}