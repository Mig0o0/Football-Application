import 'package:dartz/dartz.dart';
import 'package:kora_test_app/core/errors/failure.dart';
import 'package:kora_test_app/core/errors/server_exception.dart';
import 'package:kora_test_app/seasons/data/datasources/season_remote_data_source.dart';
import 'package:kora_test_app/seasons/domain/entities/season_team_entity.dart';
import 'package:kora_test_app/seasons/domain/repositories/season_repository_abstraction.dart';

class SeasonRepositoryImplementation implements SeasonRepositoryAbstraction{
  final SeasonRemoteDataSource remoteDataSource;

  SeasonRepositoryImplementation({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<SeasonTeamEntity>>> getSeasonTeams(String seasonId) async{
    try{
      final result = await remoteDataSource.getSeasonTeams(seasonId);
      return Right(result);
    } on ServerException catch(error){
      return Left(ServerFailure(message: error.errorMessageModel.message));
    }
  }

}