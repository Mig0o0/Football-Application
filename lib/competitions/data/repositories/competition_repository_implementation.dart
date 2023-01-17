import 'package:dartz/dartz.dart';
import 'package:kora_test_app/competitions/data/datasources/remote_data_source.dart';
import 'package:kora_test_app/competitions/domain/entities/competition_entity.dart';
import 'package:kora_test_app/competitions/domain/entities/competition_season_entity.dart';
import 'package:kora_test_app/core/errors/failure.dart';
import 'package:kora_test_app/core/errors/server_exception.dart';

import '../../domain/repositories/base_competition_repository.dart';

class CompetitionRepository extends BaseCompetitionRepository{
  final RemoteDataSource remoteDataSource;

  CompetitionRepository({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CompetitionEntity>>> getAllCompetitions() async{
    try{
      final result = await remoteDataSource.getAllCompetitions();
      return Right(result);
    } on ServerException catch(error){
      return Left(ServerFailure(message: error.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<CompetitionSeasonEntity>>> getCompetitionSeasons(String competitionId) async{
    try{
      final result = await remoteDataSource.getCompetitionSeason(competitionId);
      return Right(result);
    } on ServerException catch(error){
      return Left(ServerFailure(message: error.errorMessageModel.message));
    }
  }



}