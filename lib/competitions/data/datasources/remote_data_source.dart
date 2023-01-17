import 'package:dio/dio.dart';
import 'package:kora_test_app/competitions/data/models/competition_model.dart';
import 'package:kora_test_app/competitions/data/models/competition_season_model.dart';
import 'package:kora_test_app/core/api/endpoints.dart';
import 'package:kora_test_app/core/errors/server_exception.dart';
import 'package:kora_test_app/core/network/network_exception.dart';

abstract class RemoteDataSource{
  Future<List<CompetitionModel>> getAllCompetitions();
  Future<List<CompetitionSeasonModel>> getCompetitionSeason(String competitionId);
}


class CompetitionRemoteDataSource implements RemoteDataSource{
  @override
  Future<List<CompetitionModel>> getAllCompetitions() async{
    final response = await Dio().get(
      Endpoints.allCompetitions
    );
    
    if(response.statusCode == 200){
      return List<CompetitionModel>.from((response.data["competitions"] as List).map((competition) => CompetitionModel.fromJson(competition)));
    }else{
      throw ServerException(errorMessageModel: const ErrorMessageModel(message: "Server Error", statusCode: 500));
    }
  }

  @override
  Future<List<CompetitionSeasonModel>> getCompetitionSeason(String competitionId) async{
    final response = await Dio().get(
      Endpoints.competitionSeasonUrl(competitionId)
    );

    if(response.statusCode == 200){
      return List<CompetitionSeasonModel>.from((response.data["seasons"] as List).map((season) => CompetitionSeasonModel.fromJson(season)));
    }else{
      throw ServerException(errorMessageModel: const ErrorMessageModel(message: "Server Error", statusCode: 500));
    }
  }



}